class CreateDropDownMasters < ActiveRecord::Migration
  def change
    create_table :drop_down_masters do |t|
      t.string :model_name
      t.timestamps
    end
  end
end
