class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def new
  end
  def create
    @tweet = Tweet.new(content:params[:tweet][:content],user_id:params[:tweet][:user_id])
    @tweet.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @tweet.save   
  end

  def destroy
    user = User.find_by(id:@tweet.user_id)
    @tweet.destroy
    redirect_to user_url(user) ,notice: 'tweet was successfully deleted'
  end

  private
  def set_tweet
      @tweet = Tweet.find(params[:id])
  end
end
