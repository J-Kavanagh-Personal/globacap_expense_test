module Api::V1
  class UsersController < ApplicationController
    before_action :set_user, only: %i[ show ]

    # GET /users or /users.json
    def index
      @users = User.all
      render json: @users.as_json(only: [:name])
    end

    # GET /users/1 or /users/1.json
    def show
      @user = User.find(params[:id])
      render json: @user.as_json(only: [:name])
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
  end
end
