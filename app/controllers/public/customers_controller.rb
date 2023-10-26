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
    @like_items = @customer.like_items
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def post
    @items = Item.where(customer_id: current_customer.id).page(params[:page]).per(9)
    @tag_lists = Tag.all
    @categories = Category.all
  end


  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :image)
  end
end
