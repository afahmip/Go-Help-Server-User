class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /get_users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /get_user
  def show
    json_response(@user)
  end

  # POST /create_user
  def create
    @user = User.create!(user_params)
    json_message("User successfuly created", 200)
  end

  # PUT /update_user
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /delete_user
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :device_id)
  end
end
