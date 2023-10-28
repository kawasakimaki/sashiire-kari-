class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice:'カテゴリの登録が完了しました'
    else
      @categories = Category.all
      flash[:notice] = "カテゴリの登録に失敗しました。"
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       redirect_to admin_categories_path, notice:'カテゴリの編集が完了しました'
    else
      flash[:notice] = "カテゴリの編集に失敗しました。"
      render :edit
    end
  end

  private

  def category_params
     params.require(:category).permit(:name)
  end

end
