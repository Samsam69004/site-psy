Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :admins

  # Envoi du formulaire de contact
  resources :contacts, only: [:new, :create]

  # Accueil unique (one page dynamique)
  root to: "pages#home"

  post 'contact', to: 'pages#contact'
  get "mentions_legales", to: "pages#mentions_legales"
  get "politique_confidentialite", to: "pages#politique_confidentialite"
end
