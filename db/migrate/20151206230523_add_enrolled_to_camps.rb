class AddEnrolledToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :enrolled, :integer
  end
end
