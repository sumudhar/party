class DropDownFieldDetails < ActiveRecord::Base
belongs_to :master ,:class_name=>'DropDownMaster',:foreign_key=>:drop_down_master_id
end
