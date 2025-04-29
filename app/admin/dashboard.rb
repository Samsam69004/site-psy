ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Tableau de bord"

  content title: "Bienvenue dans l'espace admin" do
    columns do
      column do
        panel "🚀 Actions rapides" do
          ul do
            li link_to("✍️ Modifier la page d'accueil", edit_admin_page_path(Page.find_by(slug: "home")))
            li link_to("📄 Gérer toutes les pages", admin_pages_path)
          end
        end
      end
    end
  end
end
