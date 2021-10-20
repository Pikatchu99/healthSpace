require 'test_helper'

class UsControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get us_about_us_url
    assert_response :success
  end

  test "should get help_me" do
    get us_help_me_url
    assert_response :success
  end

end
