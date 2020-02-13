require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get username" do
    get welcome_username_url
    assert_response :success
  end

end
