class BlogPostsController < ApplicationController
  ARTICLE = {
    slug: "apsyse-analyse-psycho-somato-energetique",
    title: "L’APsySE : Analyse Psycho Somato Énergétique",
    excerpt: "Une approche thérapeutique qui propose des mises en situation stimulantes pour faire émerger des expériences anciennes sous forme de sensations, émotions, images, pensées ou souvenirs.",
    description: "Découvrez l’APsySE, l’Analyse Psycho Somato Énergétique, et son approche thérapeutique présentée par Frédérique Granjon à Lyon.",
    image: "apsyse-article-blog.png",
    published_at: Date.new(2026, 11, 10)
  }.freeze

  def index
    @blog_posts = [ ARTICLE ]
  end

  def show
    @blog_post = ARTICLE
    raise ActiveRecord::RecordNotFound unless params[:slug] == ARTICLE[:slug]
  end
end
