# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Page.create!(title: "Accueil", slug: "accueil", content: "<h1>Bienvenue sur mon site !</h1>")
Page.create!(title: "Mon parcours", slug: "parcours", content: "<p>Voici mon parcours.</p>")
Page.create!(title: "Outils", slug: "outils", content: "<p>Mes outils thérapeutiques.</p>")
Page.create!(title: "Le cabinet", slug: "cabinet", content: "<p>Infos sur le cabinet.</p>")
Page.create!(title: "Contact", slug: "contact", content: "<p>Formulaire de contact :</p>")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
