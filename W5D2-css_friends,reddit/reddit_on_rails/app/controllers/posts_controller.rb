class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if post_params[:sub_ids].length < 2
      flash.now[:errors] = ["Please select at least one sub"]
      render :new
      return
    end

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments_by_parent_id = @post.comments_by_parent_id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end

  def upvote
    @post = Post.find(params[:post_id])
    @comments_by_parent_id = @post.comments_by_parent_id
    Vote.create(value: 1, voteable_id: params[:post_id], voteable_type: 'Post')
    render :show
  end

  def downvote
    @post = Post.find(params[:post_id])
    @comments_by_parent_id = @post.comments_by_parent_id
    Vote.create(value: -1, voteable_id: params[:post_id], voteable_type: 'Post')
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
