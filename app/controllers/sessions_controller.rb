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

   # @user = User.find_or_create_by(email: auth[:info][:email]) do |pass|
     # pass.password = SecureRandom.hex
      
    #end  
    @authorization = Authorization.find_by_provider_and_uid(auth[:provider], auth[:uid])

    @user = User.find_or_create_by(:username => auth[:info][:email], :email => auth[:info][:email]) do |pass|
      pass.password = SecureRandom.hex
    end
    
    if @user.save
      session[:id] = @user.id
      
        redirect_to user_path(@user)
    else
        render :welcome
 
    end 
  end

  private

    def auth
      request.env["omniauth.auth"]
    end
end