require 'test_helper'

class NewAndCreateArticleTest < ActionDispatch::IntegrationTest


  setup do
    @normal_user = User.create(username: "hamza" , email: "hamza@yahoo.com" , password: "Km123456" , admin: false)
    sign_in_as(@normal_user)
  end
 
  test "new and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference('Article.count' , 1) do
      post articles_path, params: { article: { name: "hamoda" ,description: "ya rb shl"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  end
