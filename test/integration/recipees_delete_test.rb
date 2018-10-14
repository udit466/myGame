require 'test_helper'

class RecipeesDeleteTest < ActionDispatch::IntegrationTest
	def setup
		@chef= Chef.create!(chefname: "Paulo", email:"paulo@gmail.com",
      password: "password", password_confirmation: "password")
		@recipee = Recipee.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
	end


		test "successfully delete a recipee" do
  		get recipee_path(@recipee)
  		assert_template 'recipees/show'
  		assert_select 'a[href=?]', recipee_path(@recipee), text: "Delete this recipee"
  		assert_difference 'Recipee.count', -1 do
    		delete recipee_path(@recipee)
  		end
  		assert_redirected_to recipees_path
  		assert_not flash.empty?
	end






end
