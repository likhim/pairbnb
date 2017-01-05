class WelcomeController < ApplicationController

	def index
		@listings = Listing.all.order(:title).page params[:page]
		@search = Listing.filter(params.slice(:price, :max_guests, :starts_with))
	end

	private
	def filtering_params(params)
		params.slice(:price, :max_guests, :starts_with)
	end
end