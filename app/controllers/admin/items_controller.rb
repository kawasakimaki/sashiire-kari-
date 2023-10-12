class Admin::ItemsController < ApplicationController

  def index
    @items = Iuems.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
