require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		#change this on both here and recipees
		@chef= Chef.new(chefname: "paulo", email: "paulo@gmail.com", 
			password: "password", password_confirmation: "password")
	end

	test "should be valid" do
		assert @chef.valid?
	end
	test "chef name should be present" do
		@chef.chefname= " "
		assert_not @chef.valid?
	end
	test "name should be less that 30 chars" do
		@chef.chefname= "a"*31
		assert_not @chef.valid?
	end
	test "email should be present" do
		@chef.email= " "
		assert_not @chef.valid?
	end
	test "email should not be too long" do
		@chef.email= "a"*245 + "@example.com"
		assert_not @chef.valid?
	end
	test "email should accept correct format" do
		valid_emails= %w[user@example.com paulo@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
		valid_emails.each do |valids|
		@chef.email= valids
		assert @chef.valid?, "#{valids.inspect} should be valid"
	end
end
	test "email should be rejected if incorrect format" do
		invalid_emails= %w[user@example paulo@gmail,com M.firstyahoo.ca john+smith@coukorg]
		invalid_emails.each do |invalids|
		@chef.email= invalids
		assert @chef.invalid?, "#{invalids.inspect} should be invalid"
	end
end

	test "unique email and case insensitive" do
		duplicate_chef= @chef.dup
		duplicate_chef.email = @chef.email.upcase
		@chef.save
		assert_not duplicate_chef.valid?
	end

	test "email should be lower case before db" do
		mixed_email= "John@Example.com"
		@chef.email= mixed_email
		@chef.save
		assert_equal mixed_email.downcase, @chef.reload.email
	end
	#This is where the password test starts
	test "password should be present" do
		@chef.password = @chef.password_confirmation = " "
		assert_not @chef.valid?
	end
	test "password should be at least 5 characters" do
		@chef.password = @chef.password_confirmation = "x" * 4
		assert_not @chef.valid?
	end
	test "associated recipees should be destroyed" do
		@chef.save
		@chef.recipees.create!(name: "testing destroy", description: "testing destroy function")
		assert_difference "Recipee.count",-1 do
			@chef.destroy
		end
	end


end
