class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    def show
        user = User.find_by!(id: params[:id])
        render json: user, include: :items
    end

    def record_not_found
        render json: {error: "record_not_found"}, status: :not_found
    end
end
