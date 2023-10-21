class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def likes
    @customer = current_customer
    likes = LikeList.where(customer_id: @customer.id).pluck(:item_id)
    @like_items = Item.find(likes)
  end


  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email)
  end

end
