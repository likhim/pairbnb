class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.save
			redirect_to listings_path
		end
	end

	def listing_params
		params.require(:listing).permit(:title, :description, :max_guests, :price)
	end
end
