class ListingsController < ApplicationController

	before_action :find_listing, only: [:show, :edit, :update]

	def index
		@listings = Listing.all.order(:title).page params[:page]
		# @listings = Listing.where(user_id: params[:id]).order(:title).page params[:page]
	end
	# reference on order: http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-order

	def new
		@listing = Listing.new
	end

	def create
		#push current_user id into listings table
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		end
	end

	def show
		#push @listing info (eg:listing id + current_user id) into reservations table
		@reservation = @listing.reservations.new
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			flash[:success] = "Successfully updated listing"
			redirect_to @listing
		else
			flash[:danger] = "Error, cannot update listing"
			render :edit
		end
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title, :description, :max_guests, :price, {avatars: []})
	end
end
