class DropDownMaster < ActiveRecord::Base
has_many :fields,:class_name=>'DropDownFieldDetails',:dependent=>:destroy
end
