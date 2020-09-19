class EscortProfilesController < ApplicationController
  before_action :set_escort_profile, only: [:show, :update, :destroy]

  # GET /escort_profiles
  def index
    @escort_profiles = EscortProfile.all

    render json: @escort_profiles
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
    if @escort_profile.update(escort_profile_params)
      render json: @escort_profile
    else
      render json: @escort_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /escort_profiles/1
  def destroy
    @escort_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escort_profile
      @escort_profile = EscortProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def escort_profile_params
      params.require(:escort_profile).permit(:user_name, :first_name, :last_name, :profile_photo, :city, 
        :description, :photos, :price, :schedule, :stars, :verified, :sex, :age, :subscription, :phone, 
        :user_id, :type_subscription_id, :service_ids => [], :location_ids => [], :category_ids => [])
    end
end
