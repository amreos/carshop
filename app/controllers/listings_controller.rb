
class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  #before_filter :check_authorization, except: [:index, :show, :multi_find ]
  #before_action :authenticate_user!
  #load_and_authorize_resource

  # GET /listings
  # GET /listings.json
  def index
    #@listings = Listing.friendly.order(:title).page(params[:page]).per(3)
    @listings = Listing.order(:title).page(params[:page]).per(3)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    #@listing = Listing.friendly.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
    def create
     #@listing = Listing.friendly.new(listing_params)
     @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: "'#{@listing.title}' was successfully created."
    else
      render action: 'new'
    end
  end

def update
    # img_url filename.
    #temp_url_string = Listing.friendly.find(params[:id]).img_url
    temp_url_string = Listing.find(params[:id]).img_url
    if @listing.update(listing_params)
      
      # if product's img_url attribute from the form is blank
      if @listing.img_url.empty? 
        # then a copy of the filename string is assigned to the img_url attribute 
        @listing.update_attribute(:img_url, temp_url_string)
      end
      #
      redirect_to @listing, notice: "'#{@listing.title}' was successfully updated."
    else
      render action: 'edit' 
    end
  end

  def destroy
      @listing.destroy
      redirect_to root_path
    end


  def search
     #@listings = Listing.simple_search(params[:search_string])
    listings = Listing.fuzzy_search(params[:search_string])
    @listings = Kaminari.paginate_array(listings.order :title).page(params[:page]).per(4)
    if @listings.empty?
      flash.now[:alert] = "No listings found - displaying all listings ..."
    #@listings = Listing.all.order :title
    #@listings = Listing.order("title").page(params[:page]).per(5)
  end
  #@listings.order :title
    render :action => "index"
  end


   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find_by_slug(params[:id])
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :img_url, :make, :description, :model, :mpg, :price, :registered, :avatar, :image, :slug)
    end
end
