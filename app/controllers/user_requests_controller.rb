require_relative 'helpers/distance_helper'
require_relative 'helpers/notification_helper'
require 'net/http'

class UserRequestsController < ApplicationController
  include DistanceHelper, NotificationHelper

  before_action :set_user_request, only: [:show, :update, :destroy]

  # GET /get_user_requests
  def index
    @user_requests = UserRequest.all
    @user_requests.order! 'created_at DESC'
    json_response(@user_requests)
  end

  # POST /create_user_request
  def create
    @user_request = UserRequest.create!(user_request_params)
    @helpers = get_helpers

    @helpers.each { |helper|
      NotificationHelper.push_notification(helper['device_id'], "Someone needs help!")
    }
    json_message("Request successfuly created", 200)
  end

  # GET /get_user_request
  def show
    json_response(@user_request)
  end

  # PUT /user_requests/:id
  def update
    @user_request.update(user_request_params)
    head :no_content
  end

  # DELETE /delete_user_request
  def destroy
    @user_request.destroy
    head :no_content
  end

  # POST /accept_request
  def accept_request
    @user_request = UserRequest.find(params[:user_request_id])
    if not @user_request.helper_id
      @user_request.update(accept_request_params)
      render json: {
          status: 200,
          message: "Request successfully accepted"
      }.to_json
    else
      render json: {
          status: 500,
          message: "Request already been accepted"
      }.to_json
    end
  end

  # POST /retrieve_request
  def retrieve_request
    @user_requests = UserRequest.all
    @result = []

    @user_requests.each { |request|
      if request.helper_type_id == params[:helper_type_id]
        location_user = DistanceHelper::init_location(request.latitude, request.longitude)
        location_helper = DistanceHelper::init_location(params[:latitude].to_f, params[:longitude].to_f)
        distance_between = DistanceHelper::get_distance(location_user, location_helper)

        if DistanceHelper::is_helper_close_to_user(distance_between)
          @result.push(request)
        end
      end
    }
    
    json_response(@result.reverse)
  end

  private

  def get_helpers
    url = URI.parse('http://staging-gohelp-helper.herokuapp.com/get_helpers')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    JSON.parse res.body
  end

  def accept_request_params
    params.permit(:helper_id)
  end

  def user_request_params
    params.permit(:user_id, :helper_type_id, :longitude, :latitude, :device_id)
  end

  def set_user_request
    @user_request = UserRequest.find(params[:id])
  end

end
