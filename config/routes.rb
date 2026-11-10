Rails.application.routes.draw do
  # Envoi du formulaire de contact
  resources :contacts, only: [ :new, :create ]
  # Accueil unique (one page dynamique)
  root to: "pages#home"

  get "blog", to: "blog_posts#index", as: :blog
  get "blog/:slug", to: "blog_posts#show", as: :blog_post

  get "contact", to: "pages#contact"
  get "mentions_legales", to: "pages#mentions_legales"
  get "politique_confidentialite", to: "pages#politique_confidentialite"
end
