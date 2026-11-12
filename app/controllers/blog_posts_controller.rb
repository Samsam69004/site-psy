class BlogPostsController < ApplicationController
  ARTICLES = [
    {
      slug: "apsyse-analyse-psycho-somato-energetique",
      title: "L’APsySE : Analyse Psycho Somato Énergétique",
      excerpt: "Une approche thérapeutique qui propose des mises en situation stimulantes pour faire émerger des expériences anciennes sous forme de sensations, émotions, images, pensées ou souvenirs.",
      description: "Découvrez l’APsySE, l’Analyse Psycho Somato Énergétique, et son approche thérapeutique présentée par Frédérique Granjon à Lyon.",
      image: "apsyse-article-blog.png",
      published_at: Date.new(2026, 11, 10),
      paragraphs: [
        "L’Analyse Psycho Somato Énergétique (APsySE) propose une série de mises en situation stimulantes pour faire resurgir des expériences traumatiques anciennes sous forme de sensations, émotions, images, pensées ou souvenirs.",
        "Ces expériences sont ensuite verbalisées et analysées dans un but de transformation profonde et de sortie des schémas limitants du passé.",
        "Cette démarche peut contribuer à développer un « moi » plus confiant, ouvert à la vie et à l’amour, et à retrouver une bonne énergie vitale.",
        "L’APsySE est présentée comme un soutien ponctuel pour traverser une période difficile ou comme un chemin thérapeutique de plus longue durée pour mieux se connaître et comprendre son fonctionnement.",
        "Les praticiens de l’APsySE sont certifiés à la suite d’un processus thérapeutique personnel et d’une formation de plusieurs années."
      ]
    },
    {
      slug: "dialogue-corps-psychisme",
      title: "Le dialogue entre le corps et le psychisme",
      excerpt: "Mieux écouter les messages du corps pour comprendre ses émotions et avancer vers un mieux-être durable.",
      description: "Le corps et le psychisme dialoguent en permanence. Apprendre à écouter ses sensations peut aider à mieux comprendre ses émotions.",
      image: "article-blog-dialogue-corps-psychisme.png",
      published_at: Date.new(2026, 11, 12),
      paragraphs: [
        "Le corps et le psychisme sont intimement liés. Une émotion, une pensée ou une situation vécue peut se manifester par des sensations corporelles.",
        "Prendre le temps d’écouter ces signaux permet de mieux comprendre ce qui se joue en soi, sans jugement et à son propre rythme.",
        "Ce dialogue entre le corps et le psychisme ouvre un espace pour mettre des mots sur son vécu, accueillir ses émotions et retrouver progressivement un équilibre.",
        "L’accompagnement psychocorporel propose de s’appuyer sur cette écoute afin de mieux se connaître et d’avancer vers un mieux-être durable."
      ]
    },
    {
      slug: "groupe-therapie-psychocorporelle-apsyse-lyon",
      title: "Groupe de thérapie psychocorporelle APSYSE à Lyon",
      excerpt: "Le travail en groupe est un puissant catalyseur de changement. L’APSySE combine une approche analytique et une dimension corporelle pour libérer les traumatismes refoulés et les blocages émotionnels.",
      description: "Découvrez les groupes réguliers de thérapie psychocorporelle APSYSE à Lyon, leur approche analytique et corporelle, ainsi que les modalités d’inscription.",
      image: "article-blog-groupe1.png",
      images: [ "article-blog-groupe1.png", "article-blog-groupe2.png" ],
      published_at: Date.new(2026, 11, 12),
      paragraphs: [
        "Le travail en groupe est un puissant catalyseur de changement. L'APSySE combine une approche analytique et une dimension corporelle (végétothérapie) pour libérer les traumatismes refoulés et les blocages émotionnels cristallisés.",
        "Ces groupes réguliers offrent un cadre sécurisant pour explorer votre intériorité, assouplir les cuirasses musculaires et permettre à l'énergie de vie de circuler plus librement.",
        "Vous pouvez consulter l'affiche complète ci-dessus pour le détail des dates et des modalités d'inscription, ou me contacter directement pour plus de renseignements."
      ]
    }
  ].map(&:freeze).freeze

  def index
    @blog_posts = ARTICLES
  end

  def show
    @blog_post = ARTICLES.find { |article| article[:slug] == params[:slug] }
    raise ActiveRecord::RecordNotFound unless @blog_post
  end
end
