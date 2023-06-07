class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      current_user = @user;
      render json: ["#{@user.username} has signed in"], status: 200
     #"api/users/show"
    else
      render json: ["Invalid username/password combination"], status: 401
    end
  end

  def destroy
    debugger
    @user = current_user
    if @user
        logout!
        render json: ["#{@user.username} has signed out"], status: 200
        # render "api/users/show"
    else
        render json: ["Nobody signed in"], status: 404
    end
  end

end
