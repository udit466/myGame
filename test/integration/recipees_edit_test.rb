require 'test_helper'

class RecipeesEditTest < ActionDispatch::IntegrationTest
	def setup
		@chef= Chef.create!(chefname: "Paulo", email:"paulo@gmail.com",
			password: "password", password_confirmation: "password")
		@recipee = Recipee.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
	end
	test "reject invalid recipee update" do 
		get edit_recipee_path(@recipee)
		assert_template "recipees/edit"
		patch recipee_path(@recipee), params: { recipee: {name: " ", description: " some description"}}
		assert_template "recipees/edit"
		assert_select "h2.panel-title"
		assert_select "div.panel-body"
	end

	test "sucessfully edit a recipee" do 
		get edit_recipee_path(@recipee)
		assert_template 'recipees/edit'
		updated_name="updated recipee name"
		updated_description= "updated recipee description"
		patch recipee_path(@recipee), params: {recipee: {name: updated_name, description: updated_description }}
		assert_redirected_to @recipee
		#follow.redirect!
		assert_not flash.empty?
		@recipee.reload
		assert_match updated_name, @recipee.name
		assert_match updated_description, @recipee.description

	end
end
