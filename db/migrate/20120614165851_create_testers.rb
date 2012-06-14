class CreateTesters < ActiveRecord::Migration
def change
create_table :testers  do |t|
 t.string :shotcut,:limit=>1,:null=>false 
t.integer :description,:limit=>11,:null=>false 
t.decimal :decimaldata,:limit=>11,:null=>false ,:default=>true,:precision=>13,:scale=>2 
t.boolean :desc 
end
 end
 end
