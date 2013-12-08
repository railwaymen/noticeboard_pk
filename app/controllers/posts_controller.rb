class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = if params[:tag]
      Post.tagged_with(params[:tag])
    else
      Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :address, :tag_list)
  end
end
