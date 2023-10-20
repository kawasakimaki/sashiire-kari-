class Public::ItemsController < ApplicationController

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  def index
    @items = Item.page(params[:page]).per(12)
    @item_amount = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @customer = @item.customer
    @comment_list = CommentList.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to  items_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :area, :store, :image, :category_id).merge(customer_id: current_customer.id)
  end

end
