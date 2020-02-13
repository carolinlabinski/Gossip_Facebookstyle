require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get contact_display_url
    assert_response :success
  end

end
