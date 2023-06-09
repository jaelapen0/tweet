class Api::UsersController < ApplicationController
   def index 
      @users = User.all
   end

   def show
      @user = User.find_by(id: params[:id])
   end

   def create
      @user = User.new(user_params)

      if @user.save
         login(@user)
         # render "api/tweets"
      else 
         render json: @user.errors.full_messages, status: 422
      end
   end

   def destroy
      @user = User.find_by(id: params[:id])
      @user.destroy
   end

   private

   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end
