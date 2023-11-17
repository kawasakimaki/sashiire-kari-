class Admin::CommentListsController < ApplicationController

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
