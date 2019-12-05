class CookiesController < ApplicationController
    def new
        @cookie = Cookie.new
        @cookie.build_brand
    end

    def create
        @cookie = Cookie.new(cookie_params)
        @cookie.user_id = session[:user_id]
            if @cookie.save
                redirect_to sushi_path(@cookie)

            else
                render :new
            end
    end


    private 
    def cookie_params
        params.require(:cookie).permit(:description, :brand_id, brand_attributes: [:name])
      end
end

