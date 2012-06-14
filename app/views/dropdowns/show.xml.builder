xml.instruct!
xml.tag!("result") do  
xml.tag!('fields', {:name => 'dropdown' }) do
xml.tag!('table_name',@details.first.master.model_name)
@details.each do|field|
 xml << render('fields', :field =>field)
end	
end
end






