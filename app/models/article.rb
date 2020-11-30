class Article < ApplicationRecord
  belongs_to :source
  validates :title, uniqueness: true
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, dependent: :destroy
end
