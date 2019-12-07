class BrandsController < ApplicationController

   
  def index
    @brand = Brand.alpha
  end
end

private


def brand_params
    params.require(:brand).permit(:name, :in_vegan)
  end