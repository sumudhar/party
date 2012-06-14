xml.instruct!
xml.tag!("datatypes") do  
xml.tag!('datatype', {:name => 'datatype' }) do
@types.each do|type|
xml.tag!("datatype",{:name=>type.data_type_value ,:id=>type.id})
end
end 
end






