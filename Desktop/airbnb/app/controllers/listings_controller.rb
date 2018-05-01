class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
 
  # GET /listings
  # GET /listings.json
  def index
	@listing = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new

	end

 def edit
  	@listing= Listing.find(params[:id])
  	if current_user.id != @listing.user_id
        flash[:notice] 
        return redirect_to listings_url, notice:"Sorry. You are not allowed to perform this action."
      end
  end

  def verify
  	if current_user.moderator?
  		@listing = Listing.find(params[:id])
  		@listing.update(verification: true)
  		flash[:notice]
  		return redirect_to listings_url, notice: "The property #{@listing.id} has been verified"
  	else
  		flash[:notice]
  		return redirect_to listings_url, notice: "Sorry. You are not allowed to perform this action."
  	end
  end

  # POST /listings
  # POST /listings.json
  def create
  	if current_user.customer?
	    @listing = Listing.new(listing_params)

	    respond_to do |format|
	      if @listing.save
	        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
	        format.json { render :show, status: :created, location: @listing }
	      else
	        format.html { render :new }
	        format.json { render json: @listing.errors, status: :unprocessable_entity }
	      end
	    end
	end
  end




  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
  	@listing= Listing.find(params[:id])
  	user = User.all
	  	if current_user.id == @listing.user_id || current_user.admin?
	    @listing.destroy
		    respond_to do |format|
		      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
		      format.json { head :no_content }
		  	end
		else
			flash[:notice]
			return redirect_to listings_url,notice: 'Sorry. You are not allowed to perform this action'
		end
  end

  def preview
    @listing = Listing.find(params[:id])
    @image = @listing.property[0]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :place_type, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :address, :price, :description, :user_id, property: [])
    end
end
