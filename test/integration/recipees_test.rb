require 'test_helper'

class RecipeesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef= Chef.create!(chefname: "Paulo", email:"paulo@gmail.com",password: "password", password_confirmation: "password")
    @recipee = Recipee.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
    @recipee2=@chef.recipees.build(name: "chicken saute", description: "great chicken dish")
    @recipee2.save
  end
  test "should get recipees index" do
    get recipees_url
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end


  test "should get recipees listing" do
    get recipees_path
    assert_template 'recipees/index'
    assert_select "a[href=?]", recipee_path(@recipee), text: @recipee.name
    assert_select "a[href=?]", recipee_path(@recipee2), text: @recipee2.name
  end

  test "should get recipees show" do
    get recipee_path(@recipee)
    assert_template 'recipees/show'
    assert_match @recipee.name, response.body
    assert_match @recipee.description, response.body
    assert_match @chef.chefname, response.body
    assert_select "a[href=?]", edit_recipee_path(@recipee), text: "Edit this recipee"
    assert_select 'a[href=?]', recipee_path(@recipee), text: "Delete this recipee"
    end
    test "create new valid recipee" do
      get new_recipee_path
      assert_template "recipees/new"
      name_of_recipee= "chicken saute"
      description_of_recipee= "add chicken add veggies and voila"
      assert_difference "Recipee.count"  do
      post recipees_path, params: {recipee: {name: name_of_recipee, description: description_of_recipee

        }}
      end
      follow_redirect!
      assert_match name_of_recipee.capitalize, response.body
      assert_match description_of_recipee, response.body
    end

    test "reject invalid recipees" do
      get new_recipee_path
      assert_template "recipees/new"
      assert_no_difference "Recipee.count" do
        post recipees_path, params: {recipee: {name: " ", description: " "} }
      end
      assert_template "recipees/new"
      assert_select "h2.panel-title"
      assert_select "div.panel-body"
    end

    end