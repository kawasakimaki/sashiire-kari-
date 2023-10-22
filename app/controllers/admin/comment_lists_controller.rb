class Admin::CommentListsController < ApplicationController

  def destroy
    CommentList.find(params[:id]).destroy
    redirect_to admin_item_path(params[:item_id])
  end

  private

  def comment_list_params
    params.require(:comment_list).permit(:comment)
  end

end
