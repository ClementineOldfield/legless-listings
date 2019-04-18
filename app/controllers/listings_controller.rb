class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  def index
    @listings = Listing.all
  end

  def create
    @listing = Listing.create(listing_params)
    byebug
  end

  def new
    @listing = Listing.new
    @breeds = Breed.all
    @sexes = Listing.sexes.keys
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def listing_params
    new_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet)
  end

  def set_listing
    @id = params[:id]
    @listing = Listing.find(id)
  end
end