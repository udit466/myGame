require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
	def setup
		@chef= Chef.create!(chefname: "Paulo", email:"paulo@gmail.com",
			password: "password", password_confirmation: "password")
		@chef2 = Chef.create!(chefname: "john", email: "john@example.com",
                    password: "password", password_confirmation: "password")
	end
	test "reject an invalid edit" do
		sign_in_as(@chef, "password") 
		get edit_chef_path(@chef)
		assert_template "chefs/edit"
		patch chef_path(@chef), params: {chef: {chefname: " ", email: "udit4666@gmail.com"}}
		assert_template "chefs/edit"
		assert_select "h2.panel-title"
		assert_select "div.panel-body"
	end

  test "accept valid signup" do
  	sign_in_as(@chef, "password") 
		get edit_chef_path(@chef)
		assert_template "chefs/edit"
		patch chef_path(@chef), params: {chef: {chefname: "Paulo11", email: "udit46@gmail.com"}}
		assert_redirected_to @chef
		assert_not flash.empty?
		@chef.reload
		assert_match "Paulo11", @chef.chefname
		assert_match "dit46@gmail.com", @chef.email
    end
 
end
