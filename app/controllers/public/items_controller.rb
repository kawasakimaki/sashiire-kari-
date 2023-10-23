class Public::ItemsController < ApplicationController

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @customer = current_customer
    # 受け取った値を,で区切って配列にする↓
    tag_list = params[:item][:name].split(',')
    if @item.save
      @item.save_tags(tag_list)
      redirect_to item_path(@item), notice:'投稿が完了しました'
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page]).per(12)
    @item_amount = Item.all
    @categories = Category.all
    @tag_list = Tag.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    @customer = @item.customer
    @comment_list = CommentList.new
    @tag_list = @item.tags.pluck(:name).join(',')
    @item_tags = @item.tags
  end

  def edit
    @item = Item.find(params[:id])
    @tag_list = @item.tags.pluck(:name).join(',')
  end

  def update
    @item = Item.find(params[:id])
    tag_list=params[:item][:name].split(',')
    if @item.update(item_params)
      @item.save_tags(tag_list)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to  items_path
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @items = @tag.items
  end


  private

  def item_params
    params.require(:item).permit(:goods_name, :description, :price, :area, :store, :image, :category_id).merge(customer_id: current_customer.id)
  end

end
