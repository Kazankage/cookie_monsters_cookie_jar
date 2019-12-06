class BrandsController < ApplicationController

   
  def index
    @brand = Brand.all
  end
end

private


def brand_params
    params.require(:brand).permit(:name, :in_vegan)
  end