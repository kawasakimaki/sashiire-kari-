class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :customer, optional: true
  belongs_to :category
  has_many :like_lists, dependent: :destroy
  has_many :comment_lists, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags


  def get_image
    (image.attached?) ? image : "no_image.jpg"
  end

  def like_listed_by?(customer)
    like_lists.exists?(customer_id: customer.id)
  end

  def save_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

   # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end

end
