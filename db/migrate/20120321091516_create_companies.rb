class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name ,:limit=>20
      t.string :legal_name ,:limit=>20
      t.text :address,:limit=>255
      t.string :city 
      t.string :state
      t.string :zipcode
      t.integer :country_id
      t.string :phone_no
      t.string :fax
      t.string :email
      t.string :website
      t.integer :business_type_id
      t.datetime :year_from
      t.datetime :booking_from
      t.timestamps
    end
  end
end
