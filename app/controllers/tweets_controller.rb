class TweetsController < ApplicationController

  def new
  end
  def create
    tweet_params = params.require(:tweet).permit(:user_id,:content)
    @tweet = Tweet.new(tweet_params)
    @tweet.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @tweet.save

        
  end
  
end
