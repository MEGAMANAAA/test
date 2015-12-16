class CampersUsers < ActiveRecord::Migration
  def change
     create_table :campers_users, :id => false do |t|
      t.integer :camper_id
      t.integer :user_id
     end
    add_index :campers_users, [:camper_id, :user_id]
  end
end
