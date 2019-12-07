class CookiesController < ApplicationController
    def new
        @cookie = Cookie.new
        @cookie.build_brand
    end

    def create
        @cookie = Cookie.new(cookie_params)
        @cookie.user_id = session[:user_id]
        
            if @cookie.save
                redirect_to cooky_path(@cookie)

            else
                render :new
            end
    end

    def index
        @cookie = Cookie.order_by_rating
        @user = User.find_by(params[:id])  
    end

    def show
       
        @user = User.find_by(params[:id])  
        @cookie = Cookie.all
     end

    private 
    
    def cookie_params
        params.require(:cookie).permit(:flavour, :cookie_id, :description, :brand_id, brand_attributes: [:name])
      end
      
     
end

