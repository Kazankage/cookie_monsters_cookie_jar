class CookiesController < ApplicationController
    def new
        @cookie = Cookie.new
        @cookie.build_brand
    end

    def create

    end
    

    private 
    def cookie_params
        params.require(:cookie).permit(:description, :brand_id, brand_attributes: [:name])
      end
end

