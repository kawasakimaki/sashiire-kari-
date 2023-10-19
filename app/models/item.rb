class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :category
  has_many :like_lists, dependent: :destroy
  has_many :comment_lists, dependent: :destroy


  def get_image
    # unless image.attached?
    #   file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    #   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    # end
    # image.variant(resize_to_limit: [100, 100]).processed
    (image.attached?) ? image : "no_image.jpg"
  end

  def like_listed_by?(customer)
    like_lists.exists?(customer_id: customer.id)
  end

end
