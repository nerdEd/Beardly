class Auth::TwitterController < ApplicationController

  def login
    twitter_consumer = OAuth::Consumer.new(
      TWITTER_CONSUMER_KEY,
      TWITTER_CONSUMER_SECRET,
      :authorize_path => '/oauth/authenticate',
      :site => 'http://api.twitter.com'
    )

    if !returning_from_twitter?
      request_token = twitter_consumer.get_request_token(:oauth_callback => url_for(:twitter_login))
      session[:request_token]         = request_token.token
      session[:request_token_secret]  = request_token.secret
      redirect_to request_token.authorize_url    
    else
      request_token = OAuth::RequestToken.new(twitter_consumer, session[:request_token], session[:request_token_secret])
      @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
      session.delete(:request_token)
      session.delete(:request_token_secret)
      
      if @access_token
        user = JSON.parse(@access_token.get('/account/verify_credentials.json').body)
        # create a new beardly user using this users information
      end

      redirect_to root_path 
    end    
  end

  def returning_from_twitter?
    params[:oauth_verifier] && session[:request_token]
  end

end
