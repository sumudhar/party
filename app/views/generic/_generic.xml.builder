xml.generic do
  generic.attributes.each { |col, value|
			xml.tag!(col, value)
		}
generic.fields.each { |record |
  xml.fileds do
     record.attributes.each do |col,value|
			xml.tag!(col, value)
     end			
end
} unless generic.fields.nil?
end