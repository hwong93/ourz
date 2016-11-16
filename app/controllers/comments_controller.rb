class CommentsController < ApplicationController

    def show
      @comment = Comment.find(params[:id])
    end

    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      if @review.save
        
      else

      end
    end

    def destroy
      @comment = Review.find(params[:id])
      @comment.destroy
    end
end
