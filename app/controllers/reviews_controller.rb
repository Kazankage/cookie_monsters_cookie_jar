class ReviewsController < ApplicationController
    def new
       if @cookie = Cookie.find_by_id(params[:cooky_id])
            @review = @cookie.reviews.build
       else
            @review = Review.new
       end
    end

    def index
        if @cookie = Cookie.find_by_id(params[:cooky_id])
          @reviews = @cookie.reviews
        else
         @reviews = Review.all
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
         render :new
        end
    end

    def show
       @review = Review.find_by_id(params[:id])
    end


private

def review_params
    params.require(:review).permit(:cookie_id, :search, :content, :rating, :title)
end

end