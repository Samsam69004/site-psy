class Page < ApplicationRecord
  validates :title, :slug, :content, presence: true
  validates :slug, uniqueness: true
  has_rich_text :content
end

