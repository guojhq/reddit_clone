class Topics::PostsController < ApplicationController
  respond_to :js, :html
  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
    @comment = Comment.new
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    # user specific post
    if save_with_initial_vote
      flash[:notice] = "Post was saved."
      redirect_to [@post.topic, @post] 
    else 
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
    
    

  end


  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end


   def destroy
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      title = @post.title

      authorize @post
      if @post.destroy
        flash[:notice] = "\"#{title}\" was deleted successfully."
        redirect_to @topic
      else
        flash[:error] = "There are an error deleting the topic."
        render :show
      end
   end

  private

private

  def post_params
    params.require(:post).permit(:title, :body, :all_tags, static_images_attributes: [:id])
  end

  def save_with_initial_vote
    ActiveRecord::Base.transaction do 
      @post = current_user.posts.build(post_params)
      @topic = Topic.find(params[:topic_id])
      @post.topic = @topic
      authorize @post
      if @post.save
        @post.create_vote
      end
    end
    @post.valid?
  end

end
