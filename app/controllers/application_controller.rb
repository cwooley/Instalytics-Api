class ApplicationController < ActionController::API

  def index
    response = RestClient.post('https://api.instagram.com/oauth/access_token', {client_secret: ENV['secret'], client_id: ENV['client_id'], redirect_uri: 'https://instalytics-api.herokuapp.com/', code: params[:code], grant_type: 'authorization_code'})
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
    @user.access_token = access_token
    user_data_response = RestClient.get("https://api.instagram.com/v1/users/self/?access_token=#{@user.access_token}")
    user_data_obj = JSON.parse(user_data_response.body)["data"]
    @user.posts_count = user_data_obj["counts"]["media"]
    @user.followers_count = user_data_obj["counts"]["followed_by"]
    @user.following_count = user_data_obj["counts"]["follows"]
    @user.save

    # render json: @user
    picture_response = RestClient.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{@user.access_token}")
    picture_data_obj = JSON.parse(picture_response.body)["data"]
    picture_data_obj.each do |picture|
      @picture = Picture.find_or_create_by(standard_resolution_url: picture["images"]["standard_resolution"]["url"])
      @picture.user_id = @user.id
      @picture.likes_count = picture["likes"]["count"]
      @picture.comments_count = picture["comments"]["count"]
      @picture.created_time = Time.at(picture["created_time"].to_i)
      @picture.standard_resolution_url = picture["images"]["standard_resolution"]["url"]
      @picture.thumbnail_url = picture["images"]["thumbnail"]["url"]
      @picture.instagram_id = picture["id"]
      @picture.filter = picture["filter"]
      @picture.save
      # likes_response = RestClient.get("https://api.instagram.com/v1/media/#{@picture.instagram_id}/likes?access_token=#{@user.access_token}")
      # likesDataObj = JSON.parse(likes_response)
    end
    redirect_to "https://instalytics-fe.herokuapp.com/?id=#{@user.id}"
  end

end
