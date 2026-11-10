require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/"

    assert_response :success
    assert_select "h1", /Frédérique Granjon/
    assert_select "img[alt]"
  end

  test "should redirect on contact" do
    get "/contact"

    assert_response :redirect
  end

  test "home exposes SEO metadata" do
    get root_path

    assert_response :success
    assert_select "title", /Frédérique Granjon/
    assert_select "meta[name='description'][content]"
    assert_select "link[rel='canonical'][href='http://www.example.com/']"
    assert_select "meta[property='og:title'][content]"
    assert_select "meta[property='og:description'][content]"
    assert_select "script[type='application/ld+json']", count: 1
  end
end
