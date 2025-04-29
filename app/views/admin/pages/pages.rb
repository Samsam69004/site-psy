ActiveAdmin.register Page do
  permit_params :title, :content

  index do
    selectable_column
    id_column
    column :title
    column :content do |page|
      truncate(page.content, length: 100)
    end
    actions
  end

  form do |f|
    f.inputs "Détails de la page" do
      f.input :title, label: "Titre"
      f.input :content, as: :text, label: "Contenu"
    end
    f.actions
  end
end
