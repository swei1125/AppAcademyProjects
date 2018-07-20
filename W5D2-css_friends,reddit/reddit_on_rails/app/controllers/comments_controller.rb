class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.parent_comment_id = params[:parent_comment_id]
    if @comment.save
      redirect_to post_url(params[:post_id])
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def upvote
    @comment = Comment.find(params[:comment_id])
    Vote.create(value: 1, voteable_id: params[:comment_id], voteable_type: 'Comment')
    render :show
  end

  def downvote
    @comment = Comment.find(params[:comment_id])
    Vote.create(value: -1, voteable_id: params[:comment_id], voteable_type: 'Comment')
    render :show
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
