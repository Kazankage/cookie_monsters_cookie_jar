class CookiesController < ApplicationController
    def new
        @cookie = Cookie.new
        @cookie.build_brand
   
    end

    def create
        @cookie = Cookie.new(cookie_params)
        @cookie.user_id = session[:user_id]
            if @cookie.save!
                redirect_to cooky_path(@cookie)

            else
                render :new
            end
    end

    def index
        @cookie = Cookie.all
        @user = User.find_by(params[:id])  
    end

    def show
        @user = User.find_by(params[:id])   
     end

    private 
    
    def cookie_params
        params.require(:cookie).permit(:flavour, :description, :brand, :brand_id, brand_attributes: [:name])
      end
      
     
end

