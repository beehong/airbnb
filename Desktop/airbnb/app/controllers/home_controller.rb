class HomeController < ApplicationController
	def index
	@listing = Listing.paginate(:page => params[:page])
	end
end