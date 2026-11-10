require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  ARTICLE_SLUG = "apsyse-analyse-psycho-somato-energetique"

  test "blog index displays the article list" do
    get blog_path

    assert_response :success
    assert_select "h1", /Articles et réflexions/
    assert_select "article"
    assert_select "a[href='#{blog_post_path(ARTICLE_SLUG)}']"
    assert_select "img[alt]"
  end

  test "blog index exposes SEO metadata" do
    get blog_path

    assert_response :success
    assert_select "title", /Blog/
    assert_select "meta[name='description'][content]"
    assert_select "link[rel='canonical'][href='http://www.example.com/blog']"
    assert_select "meta[property='og:title'][content]"
    assert_select "script[type='application/ld+json']", count: 1
  end

  test "article page displays the requested article" do
    get blog_post_path(ARTICLE_SLUG)

    assert_response :success
    assert_select "h1", /APsySE/
    assert_select "article"
    assert_select "img[alt]"
    assert_select "a[href='#{blog_path}']"
  end

  test "article page exposes Article structured data" do
    get blog_post_path(ARTICLE_SLUG)

    assert_response :success
    structured_data = JSON.parse(css_select("script[type='application/ld+json']").first.text)

    assert_equal "Article", structured_data.fetch("@type")
    assert_equal ARTICLE_SLUG, URI.parse(structured_data.fetch("url")).path.split("/").last
  end

  test "unknown article returns not found" do
    get blog_post_path("article-inexistant")

    assert_response :not_found
  end
end
