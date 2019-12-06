class ApplicationController < ActionController::Base
    def current_user
        User.find_by(:username => session[:username]) if session[:username]
         #User.find(session[:username])
       end
end
