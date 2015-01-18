require 'rails_helper'
require 'pry'

describe "Visiting profiles" do
 
  include Warden::Test::Helpers

  before do 
    Warden.test_mode!
    @user = create(:user_with_posts_and_comments)
    @post = @user.posts.first
    @comment = @user.comments.first
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
    #binding.pry 
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)

    end

  end

  describe "signed in" do

    before do 
      login_as(@user, :scope => :user)
    end

    after do 
      Warden.test_reset!
      logout(:user)
    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)

    end

  end
end  