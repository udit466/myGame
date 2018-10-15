require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "mashrur", 
                        email: "mashrur@example.com",
                        password: "password", 
                        password_confirmation: "password")
    @recipee = Recipee.create(name: "vegetable saute", 
        description: "great vegetable sautee, add vegetable and oil", 
        chef: @chef)
    @recipee2 = @chef.recipees.build(name: "chicken saute", 
                          description: "great chicken dish")
    @recipee2.save
  end
  
  test "should get chefs show" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipee_path(@recipee), text: @recipee.name
    assert_select "a[href=?]", recipee_path(@recipee2), text: @recipee2.name
    assert_match @recipee.description, response.body
    assert_match @recipee2.description, response.body
    assert_match @chef.chefname, response.body
  end



end
