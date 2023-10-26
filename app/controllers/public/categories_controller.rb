class Public::CategoriesController < ApplicationController

  def show
    @categories = Category.page(params[:page]).per(9)
    @category = Category.find(params[:id])
    @tag_lists = Tag.all
  end

end
