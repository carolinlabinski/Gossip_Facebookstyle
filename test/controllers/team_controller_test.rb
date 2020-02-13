require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get team_display_url
    assert_response :success
  end

end
