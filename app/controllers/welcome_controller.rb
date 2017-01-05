class WelcomeController < ApplicationController

	def index
		@listings = Listing.all.order(:title).page params[:page]
	end

	private
	def filtering_params(params)
		params.slice(:price, :max_guests, :starts_with)
	end
end