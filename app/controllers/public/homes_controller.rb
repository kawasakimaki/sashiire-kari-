class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :guest_sign_in]

  def top
    @categories = Category.all
    @tag_lists = Tag.all
  end

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
