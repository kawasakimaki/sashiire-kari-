class Public::CategoriesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :guest_sign_in, :about]

  def show
    @categories = Category.page(params[:page]).per(8)
    @category = Category.find(params[:id])
    @tag_lists = Tag.all
  end

end
