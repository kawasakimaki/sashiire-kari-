class Public::CommentListsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    comment = current_customer.comment_lists.new(comment_list_params)
    comment.item_id = item.id
    comment.save
    redirect_to item_path(item)
  end

  def destroy
    CommentList.find(params[:id]).destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def comment_list_params
    params.require(:comment_list).permit(:comment)
  end


end
