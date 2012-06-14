module SchemaGenerate
 class Base
  def self.create(data=nil,table=nil)
       records=data.fields
       column_data=[]
       unless records.nil?
         records.each do |col|
         case col.data_type
         when  'binary','integer','string','text'
	 column_data<<"t.#{col.data_type} :#{col.col_name.downcase},:limit=>" +eval("col.data_size.nil? ? 1: col.data_size.to_i").to_s + ",:null=>" + eval("col.allow.nil? ?true:col.allow").to_s  
	 when 'decimal'
	 column_data<<"t.#{col.data_type} :#{col.col_name.downcase},:limit=>" +eval("col.data_size.nil? ? 13: col.data_size.to_i").to_s+",:null=>" + eval("col.allow.nil? ?true:col.allow").to_s+" ,:default=>true,:precision=>13,:scale=>2" 				  	
	 when 'time','timestamp','float','boolean','date','datetime'
	 column_data<<"t.#{col.data_type} :#{col.col_name.downcase}"
	end	# end of case 
    end #end of each
    db_file=File.join("db","migrate", Time.now.strftime('%Y%m%d%H%M%S')+'_create_'+table.downcase.pluralize+".rb")
    db_file_name="Create"+table.pluralize.capitalize
    File.open(db_file, "w+") do |f|
    f << "class #{db_file_name} < ActiveRecord::Migration\n"
    f<<"def change\n"
    f<<"create_table :"+ eval("table.downcase.pluralize")+"  do |t|\n "
    column_data.each do |col|
       f<<eval("col")<<" \n"
     end
    f<<"end\n end\n end\n" 
   end # file writing end 
   result=ActiveRecord::Migrator.migrate(Rails.root.join('db','migrate'))
   puts "Result is #{result}"
   model_file=File.join("app","models",table.downcase.singularize+".rb")
   model_file_name=table.singularize.capitalize
    File.open(model_file, "w+") do |f|
    f << "class #{model_file_name} < ActiveRecord::Base\n end\n"
   end # file writing end 
  end# end of unless 
  end # method end	    
 end #class edn	     
end # ,module end 