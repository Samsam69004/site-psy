require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/"
    assert_response :success
  end

  test "should redirect on contact" do
    get "/contact"
    assert_response :redirect
  end
end
