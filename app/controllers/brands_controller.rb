class BrandsController < ApplicationController

   
  def index
    @brand = Brand.all
  end
end
