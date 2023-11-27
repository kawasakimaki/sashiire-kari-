class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :guest_sign_in, :about]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_mypage_path, notice:'編集が完了しました'
  end

  def likes
    @customer = current_customer
    @like_items = @customer.like_items
    @tag_lists = Tag.all
    @categories = Category.all
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
    @customer = current_customer
    @items = Item.where(customer_id: current_customer.id).page(params[:page]).per(9).order(created_at: :desc)
    @tag_lists = Tag.all
    @categories = Category.all
  end


  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :image)
  end

end
