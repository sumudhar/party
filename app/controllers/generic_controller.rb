class GenericController < ApplicationController
#include SchemaGenerate
def valaidtypes
  @types=ValidDataType.set
   render:types
end	

def create
   puts params[:generic].to_xml
   table=params[:generic][:data][:table_name]
   fields_info=params[:generic][:data][:records][:record]
   mode=params[:generic][:data][:mode]
   @hash=Hash.new
   DropDownMaster.transaction do
   @master=DropDownMaster.new(:model_name=>table)
   @master.save
   if @master
    unless fields_info.nil?
      unless fields_info.kind_of? HashWithIndifferentAccess
               fields_info.each do |field|
               drop_down_record= @master.fields.new(field) 
               drop_down_record.save
              end
       else
               # insert single chargeline
               field=fields_info
               drop_down_record=@master.fields.new(field) 
               drop_down_record.save
       end  # end of dropdown fields save
   end # end of  fields nil
    records=SchemaGenerate::Base.create @master,table
   end # end of if
   end # end of transaction
   respond_to do |format|
    format.xml {render :add, status: :created}
    format.html
   end
end
end 
