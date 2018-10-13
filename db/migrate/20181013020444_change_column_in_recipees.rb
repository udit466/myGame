class ChangeColumnInRecipees < ActiveRecord::Migration[5.2]
  def change
  	rename_column :recipees, :email, :description
  	change_column :recipees, :description, :text
  end
end
