class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10).tagged_with(params[:tag])
    else 
      @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
    end
  end
end