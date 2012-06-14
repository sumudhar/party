class CreateDropDownFieldDetails < ActiveRecord::Migration
  def change
    create_table :drop_down_field_details do |t|
      t.string  :col_name
      t.string  :data_type
      t.integer :data_size
      t.string  :control_type
      t.boolean :allow
      t.boolean :visible
      t.integer :tab_id
      t.string :label_name
      t.boolean :col_status
      t.integer :drop_down_master_id
      t.timestamps
    end
  end
end
