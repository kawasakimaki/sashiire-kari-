class Public::CommentListsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = current_customer.comment_lists.new(comment_list_params)
    @comment.item_id = @item.id
    @comment.save
  end

  def destroy
    @comment = CommentList.find(params[:id])
    @item = @comment.item
    @comment.destroy
  end

  private

  def comment_list_params
    params.require(:comment_list).permit(:comment)
  end


end
