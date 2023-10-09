class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :like_lists, dependent: :destroy
  has_many :comment_lists, dependent: :destroy
  has_many :items, dependent: :destroy
end
