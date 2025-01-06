class Article < ApplicationRecord
  has_rich_text :content
  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true
end
