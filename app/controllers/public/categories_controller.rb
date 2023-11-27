class Public::CategoriesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :guest_sign_in, :about]

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @category_items = @category.items.page(params[:page]).per(8).order(created_at: :desc)
    @tag_lists = Tag.all
  end

end
