class ApplicationController < ActionController::API

  def index
    response = RestClient.post('https://api.instagram.com/oauth/access_token', {client_secret: ENV['secret'], client_id: ENV['client_id'], redirect_uri: 'http://localhost:3000/', code: params[:code], grant_type: 'authorization_code'})
    dataObj = JSON.parse(response.body)["user"]
    access_token = JSON.parse(response.body)["access_token"]
    @user = User.find_or_create_by(instagram_id:dataObj["id"])
    @user.instagram_id = dataObj["id"]
    @user.profile_picture_url = dataObj["profile_picture"]
    @user.username = dataObj["username"]
    @user.full_name = dataObj["full_name"]
    # @user.posts_count = dataObj["counts"]["media"]
    # @user.followers_count = dataObj["counts"]["followed_by"]
    # @user.following_count = dataObj["counts"]["follows"]
    byebug
    @user.access_token = access_token
    @user.save
    redirect_to: 'http://localhost:3001', 
  end

end
