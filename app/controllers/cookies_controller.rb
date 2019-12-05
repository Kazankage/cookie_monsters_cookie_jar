class CookiesController < ApplicationController
    def new
        @cookie = Cookie.new
    end
end
