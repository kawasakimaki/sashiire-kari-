class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @customer = @item.customer
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to  admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:id, :customer_id, :category_id, :name, :description, :price, :area, :store)
  end

end
