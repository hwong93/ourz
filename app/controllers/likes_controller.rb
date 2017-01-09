class LikesController < ApplicationController

  def new
  end

  def create
    @like = Like.new(like_params)

    if @like.save
      render nothing: true
      @like.create_activity :create, owner: current_user, recipient: @comment.post.user
    else
      # render :new
    end
  end


  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    @like.create_activity :destroy, owner: current_user, recipient: @comment.post.user

    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
