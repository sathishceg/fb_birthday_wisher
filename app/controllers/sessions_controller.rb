class SessionsController < ApplicationController
  def create
    user = construct_user(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def construct_user(omniauth)
      user = User.new
      user.name = omniauth.info.name
      user.uid = omniauth.uid
      user.provider = omniauth.provider
      user.oauth_token = omniauth.credentials.token
      user.oauth_expires_at = Time.at(omniauth.credentials.expires_at)
      user.save
      user
    end
end
