class ReviewsController < ApplicationController
    def new
       @cookie = Cookie.find_by_id(params[:id])
       @review = @cookie.build_review
    end

    def index
    end

end
