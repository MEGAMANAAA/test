class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :camps, :campers do |t|
      t.index [:camp_id, :camper_id]
      t.index [:camper_id, :camp_id]
      t.string :status
    end
  end
end
