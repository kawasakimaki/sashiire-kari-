class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  belongs_to :category
  has_many :like_lists, dependent: :destroy
  has_many :comment_lists, dependent: :destroy
end
