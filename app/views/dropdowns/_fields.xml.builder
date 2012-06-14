xml.record do
  field.attributes.each { |col, value|
			xml.tag!(col, value)
		}
end