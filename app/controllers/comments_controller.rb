class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id], id: params[:id])
    if @comment
      @comment.destroy
      redirect_to user_post_path(@comment), notice: 'Comment deletion successfull.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Comment not found'
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
