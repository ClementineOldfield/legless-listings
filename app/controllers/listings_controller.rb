class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_breeds_and_sexes, only: [:new, :edit]
  
  def index
    @listings = Listing.all
  end

  def create
    @listing = Listing.create(listing_params)
    @listing.errors.any? 
    if @listing.errors.any?
      set_breeds_and_sexes
      render "new"
    else
      redirect_to listings_path
    end
  end

  def new
    @listing = Listing.new
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_breeds_and_sexes
    @breeds = Breed.all
    @sexes = Listing.sexes.keys
  end

  def listing_params
    new_params = params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :picture)
  end

  def set_listing
    @id = params[:id]
    @listing = Listing.find(@id)
  end
end