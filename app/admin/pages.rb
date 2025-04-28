ActiveAdmin.register Page do
  permit_params :title, :slug, :content, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.rich_text_area :content
      f.input :image
    end
    f.actions
  end
end
