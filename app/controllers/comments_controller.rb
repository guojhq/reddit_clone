class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @topic = Topic.find(params[:topic_id])
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
