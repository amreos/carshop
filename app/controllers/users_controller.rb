class UsersController < ApplicationController

before_action :authenticate_user!, only: [:edit, :update]
#before_action :check_authorization, only: [:edit, :update]
#before_action :set_user

  def show
   #@user = User.friendly.find(params[:id])
   @user = User.find(params[:id])
  end
  end

  def edit
    #might need to remove this code, hav error in edit form
    @user = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = "Something went wrong, Please try again"
      render :edit
    end
  end

 # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      #UserMailer.welcome_email(@user).deliver

      format.html { redirect_to(@user, notice: 'User was successfully created.') }
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: 'new' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  private

  def check_authorization
    unless current_user.id == params[:id].to_i
      redirect_to root_url
    end
  end

  def set_user
    #@user = User.friendly.find(params[:id])
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :last_name, :avatar, :description, :slug)
  end
end
