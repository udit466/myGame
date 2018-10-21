class RecipeeIngredient < ApplicationRecord
	belongs_to :ingredient
	belongs_to :recipee
end