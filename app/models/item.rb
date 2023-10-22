class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :category
  has_many :like_lists, dependent: :destroy
  has_many :comment_lists, dependent: :destroy


  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end

  def like_listed_by?(customer)
    like_lists.exists?(customer_id: customer.id)
  end

end
