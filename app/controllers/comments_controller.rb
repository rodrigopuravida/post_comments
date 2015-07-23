class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    respond_to do |format|
      format.html
      format.json {render json: @posts}
      format.xml {render xml: @posts}
    end
  end



  def new
    # render json:params
    @comment = Comment.new

    @post = Post.find_by_id(params[:post_id])

    # render thing
    # return;

  end


  def create

    # render json:params
    # return

    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create comment_params
    current_user.comments << @comment

    if @comment.persisted?
      redirect_to posts_path
    else
      render :new
    end

 end

 private

 def comment_params
  params.require(:comment).permit(:body)
 end

end
