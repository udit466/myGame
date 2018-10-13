require 'test_helper'

class RecipeesDeleteTest < ActionDispatch::IntegrationTest
	def setup
		@chef= Chef.create!(chefname: "Paulo", email:"paulo@gmail.com")
		@recipee = Recipee.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
	end









end
