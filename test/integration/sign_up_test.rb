require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  
  test "sign up" do
    get "/signup"
    assert_response :success
    assert_difference('User.count' , 1) do
      post users_path, params: { user: { username: "hamoda" ,email: "hamoda@yahoo.com", password: "Km123456"  } }
      assert_response :redirect
    end
    assert_redirected_to users_url
  end


end
