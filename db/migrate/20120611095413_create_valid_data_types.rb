class CreateValidDataTypes < ActiveRecord::Migration
  def change
    create_table :valid_data_types do |t|
       t.string :data_type_value
       t.timestamps
    end
  end
end
