class SearchController < ApplicationController

	def index
		@search = Listing.filter(params[:listing].slice(:price, :max_guests, :starts_with))
		@results = @search.all.order(:title).page params[:page]
	end
end
