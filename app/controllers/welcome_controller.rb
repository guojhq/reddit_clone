class WelcomeController < ApplicationController
  #  invoke the index view inside the app/views/welcome directory.
  def index
    @topics = Topic.visible_to(current_user)
    authorize @topics 
  end

  def about
  end
end
