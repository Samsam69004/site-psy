require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get parcours" do
    get pages_parcours_url
    assert_response :success
  end

  test "should get outils" do
    get pages_outils_url
    assert_response :success
  end

  test "should get cabinet" do
    get pages_cabinet_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end
end
