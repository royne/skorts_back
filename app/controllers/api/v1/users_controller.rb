class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.with_role(:escort)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.add_role(:user)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create_escort
    ActiveRecord::Base.transaction do 
      phone = params[:user][:phone]
      if EscortProfile.find_by(phone: phone)
        render json: { error: 'Celular ya se encuentra registrado'},  status: :unprocessable_entity
        return
      end  
      user = User.new(user_params)
      user.add_role(:escort)
      if user.save
        escort = EscortProfile.new(username: user.username, phone: phone)
        escort.user = user
        escort.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def current
    render json: current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
