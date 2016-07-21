class AddDescriptionsToTables < ActiveRecord::Migration[5.0]
    change_table :albums do |t|
      t.text :description
    end 

    change_table :books do |t|
      t.text :description
    end 

    change_table :movies do |t|
      t.text :description
    end 
end
