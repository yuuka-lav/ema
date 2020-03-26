class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      @comment = Comment.create(comment_params)
      respond_to do |format|
        format.html { redirect_to item_path(params[:item_id])  }
        format.json
      end
      # redirect_to item_path(params[:item_id])
    else
      render :show
    end
  end
  # @comment = Comment.create(comment_params)
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
