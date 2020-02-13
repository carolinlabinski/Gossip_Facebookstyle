require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get information" do
    get user_information_url
    assert_response :success
  end

end
