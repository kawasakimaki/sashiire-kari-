class Public::ItemsController < ApplicationController

  def create
    @item = Item.new
    @item.save
    redirect_to item_path(@item.id)
  end

  def index
    @items = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :area, :store, :image)
  end

end
