require 'test_helper'
class RecipeeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create!(chefname: "Paulo", email: "paulo@gmail.com",password: "password", password_confirmation: "password")
		@recipee =@chef.recipees.build(name: "vegetable", description: "Great veg recipee")

	end
	test "Recipee without test should be invalid"do
		@recipee.chef_id =nil
		assert_not @recipee.valid?
	end
	test "recipee should be valid" do
		assert @recipee.valid?
	end

	test "recipee should be present" do
		@recipee.name= " "
		assert_not @recipee.valid?
	end

	test "description should be present" do
		@recipee.description= " "
		assert_not @recipee.valid?
	end
	test "description shouldn't be less than 5 characters" do
		@recipee.description= "a"*3
		assert_not @recipee.valid?
	end
	test "description shouldn't be more than 500 characters" do
		@recipee.description= "a"*501
		assert_not @recipee.valid?
	end	
end
