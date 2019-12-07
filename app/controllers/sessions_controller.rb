class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
      end

    def new
    end

    def create 
  
        @user = User.find_by(username: params[:user][:username])

        if @user.try(:authenticate, params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)

        else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          redirect_to login_path
        end
    
  end


  def omniauth
    byebug
    @user = User.find_or_create_by(email: auth[:info][:email]) do |pass|
      pass.password = SecureRandom.hex
      pass.username = pass.email
    end
    sessions[:id] = @user.id
    #User.where(email: auth[:info][:email]).first_or_initialize     
  end

  private

    def auth
      request.env["omniauth.auth"]
    end
end