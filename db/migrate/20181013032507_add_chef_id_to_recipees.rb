class AddChefIdToRecipees < ActiveRecord::Migration[5.2]
  def change
  	add_column :recipees, :chef_id, :integer
  end
end
