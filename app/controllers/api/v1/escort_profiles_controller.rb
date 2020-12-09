class Api::V1::EscortProfilesController < ApplicationController
  before_action :set_escort_profile, only: [:show, :update, :destroy]

  # GET /escort_profiles
  def index
    @escort_profiles = EscortProfile.all

    # render json: @escort_profiles
    render json: current_user.escort_profile
  end

  # GET /escort_profiles/1
  def show
    render json: @escort_profile
  end

  # POST /escort_profiles
  def create
    @escort_profile = EscortProfile.new(escort_profile_params)

    if @escort_profile.save
      render json: @escort_profile, status: :created, location: @escort_profile
    else
      render json: @escort_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /escort_profiles/1
  def update
    @escort_profile.category_ids = params[:categories] if params[:categories].present?
    @escort_profile.service_ids = params[:services] if params[:services].present?
    @escort_profile.location_ids = params[:locations] if params[:locations].present?
    
    if params[:photos_0].present?
      array_photos = []
      params.each { |x| array_photos.push(x[1])}
      @escort_profile.photos = array_photos
      if @escort_profile.save
        render json: @escort_profile, status: :ok
      else
        render json: @escort_profile.errors, status: :unprocessable_entity
      end
      return
    end
    
    if @escort_profile.update(escort_profile_params)
      render json: @escort_profile, status: :ok
    else
      render json: @escort_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /escort_profiles/1
  def destroy
    @escort_profile.destroy
  end

  def escorts_selected
    services = Service.all
    locations = Location.all
    categories = Category.all
    options = {services: [], locations: [], categories: []}
    services.map { |x| options[:services].push({label: x.name, value: x.id})}
    locations.map { |x| options[:locations].push({label: x.name, value: x.id})}
    categories.map { |x| options[:categories].push({label: x.name, value: x.id})}

    render json: options 
  end
  
  def one_profile
    if current_user.present? && current_user.has_role?(:escort)    
      render json: current_user.escort_profile
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escort_profile
      @escort_profile = EscortProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def escort_profile_params
      params.permit(:user_name, :first_name, :last_name, :profile_photo, :city, 
        :description, :price, :schedule, :stars, :verified, :sex, :age, :subscription, :phone, 
        :user_id, :type_subscription_id, {:photos => [], :service_ids => [], :location_ids => [], :category_ids => []})
    end
end














