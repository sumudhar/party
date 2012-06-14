class ValidDataType < ActiveRecord::Base
scope:set,select('id,data_type_value')
end
