class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

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
    redirect_to  admin_items_path, notice:'投稿の削除が完了しました'
  end

  private

  def item_params
    params.require(:item).permit(:id, :customer_id, :category_id, :goods_name, :description, :price, :area, :store)
  end

end
