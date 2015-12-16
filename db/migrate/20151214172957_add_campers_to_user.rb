class AddCampersToUser < ActiveRecord::Migration
  def change
    add_column :users, :campers, :camper, array: true
  end
end
