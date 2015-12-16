class AddAmWeeksToCamps < ActiveRecord::Migration
  def change
	add_column :camps, :am, :boolean
	add_column :camps, :weeks, :string
	Camp.all.each do |camp|
	  camp.update_attributes!(:am => 'true', :weeks=>'1')
	end
  end
end
