class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          session[:user_username] = @user.username
          session[:user_email] = @user.email
          redirect_to user_path(@user)
        else
          render :new
        end
      end
 
      def show
        #redirect_if_not_logged_in
        if @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
        end
      end

      def index
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
      end

      private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end
end