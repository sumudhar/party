xml.instruct!
xml.tag!("result") do  
xml.tag!('dropdowns', {:name => 'dropdown' }) do
@dropdowns.each do|dropdown|
xml.tag!("dropdown",{:name=>dropdown.model_name ,:id=>dropdown.id})
	
end
end 
end






