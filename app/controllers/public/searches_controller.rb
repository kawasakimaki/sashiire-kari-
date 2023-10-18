class Public::SearchesController < ApplicationController
  
  def category_search
    @category_id = params[:category_id]
    @items = Item.where(category_id: @category_id)
  end
  
end
