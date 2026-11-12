require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  ARTICLE_SLUG = "apsyse-analyse-psycho-somato-energetique"
  NEW_ARTICLE_SLUG = "dialogue-corps-psychisme"
  GROUP_ARTICLE_SLUG = "groupe-therapie-psychocorporelle-apsyse-lyon"

  test "blog index displays the article list" do
    get blog_path

    assert_response :success
    assert_select "h1", /Articles et réflexions/
    assert_select "article", count: 3
    assert_select "a[href='#{blog_post_path(ARTICLE_SLUG)}']"
    assert_select "a[href='#{blog_post_path(NEW_ARTICLE_SLUG)}']"
    assert_select "a[href='#{blog_post_path(GROUP_ARTICLE_SLUG)}']"
    assert_select "img[src*='apsyse-article-blog'][alt]"
    assert_select "img[src*='article-blog-dialogue-corps-psychisme'][alt]"
    assert_select "img[src*='article-blog-groupe1'][alt]"
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
    assert_select "img[src*='apsyse-article-blog'][alt]"
    assert_select "a[href='#{blog_path}']"
  end

  test "new article page displays the requested article" do
    get blog_post_path(NEW_ARTICLE_SLUG)

    assert_response :success
    assert_select "h1", /dialogue entre le corps et le psychisme/i
    assert_select "img[src*='article-blog-dialogue-corps-psychisme'][alt]"
    assert_select "a[href='#{blog_path}']"
  end

  test "article page exposes Article structured data" do
    get blog_post_path(ARTICLE_SLUG)

    assert_response :success
    structured_data = JSON.parse(css_select("script[type='application/ld+json']").first.text)

    assert_equal "Article", structured_data.fetch("@type")
    assert_equal ARTICLE_SLUG, URI.parse(structured_data.fetch("url")).path.split("/").last
  end

  test "group article page displays both requested images and content" do
    get blog_post_path(GROUP_ARTICLE_SLUG)

    assert_response :success
    assert_select "h1", /Groupe de thérapie psychocorporelle APSYSE à Lyon/
    assert_select "img[src*='article-blog-groupe1'][alt]"
    assert_select "img[src*='article-blog-groupe2'][alt]"
    assert_select "p", /puissant catalyseur de changement/
    assert_select "a[href='#{blog_path}']"
  end

  test "unknown article returns not found" do
    get blog_post_path("article-inexistant")

    assert_response :not_found
  end
end
