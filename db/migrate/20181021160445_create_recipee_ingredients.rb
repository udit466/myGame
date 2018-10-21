class CreateRecipeeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipee_ingredients do |t|
    	t.integer :recipee_id
    	t.integer :ingredient_id
    end
  end
end
