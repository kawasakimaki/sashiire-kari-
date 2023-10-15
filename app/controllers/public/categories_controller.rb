class Public::CategoriesController < ApplicationController

  def index
   @categories = Category.all
  end

end
