class PostsController < ApplicationController

  before_action :require_login

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post
      else
        render :new
      end
    else
      render :new, alert: "You need to login"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
