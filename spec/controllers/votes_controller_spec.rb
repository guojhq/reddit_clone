require 'rails_helper'

describe VotesController do 

  include Devise::TestHelpers

  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    sign_in @user
  end

  describe '#up_vote' do
    it "adds an up-vote to the post" do
      request.env["HTTP_REFERER"] = '/'
      expect {
        post( :up_vote, post_id: @post.id )
      }.to change{ @post.up_votes }.by 1
    end
  end

  describe '#up_vote' do
    it "adds an down-vote to the post" do
      request.env["HTTP_REFERER"] = '/'
      expect {
        post( :down_vote, post_id: @post.id )
      }.to change{ @post.down_votes }.by 1
    end
  end
end