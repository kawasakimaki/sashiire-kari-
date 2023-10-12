class Admin::ItemsController < ApplicationController

  def index
    @items = Items.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:id, :customer_id, :category_id, :name, :description, :price, :area, :store)
  end

end
