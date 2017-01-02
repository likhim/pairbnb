class WelcomeController < ApplicationController

	def index
		@listings = Listing.all.order(:title).page params[:page]
	end
end