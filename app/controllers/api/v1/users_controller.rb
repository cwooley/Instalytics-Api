class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create

    ##We want to take in username and an AccessToken has_secure_password
    ##We will get the access_token from the client side


    access_token = '900417450.2d821cb.2856c10ab14549acb96839909365761f'
    # access_token = params[:access_token]
    url = 'https://api.instagram.com/v1/users/self/?access_token=' + access_token

    response = RestClient.get(url, headers={})
    dataObj = JSON.parse(response.body)["data"]
    @user = User.find_or_create_by(instagram_id:dataObj["id"])
    @user.instagram_id = dataObj["id"]
    @user.profile_picture_url = dataObj["profile_picture"]
    @user.username = dataObj["username"]
    @user.full_name = dataObj["full_name"]
    @user.posts_count = dataObj["counts"]["media"]
    @user.followers_count = dataObj["counts"]["followed_by"]
    @user.following_count = dataObj["counts"]["follows"]
    @user.save
    render json: @user
  end


  private

  def user_params
    params.require(user).permit()
  end

end
