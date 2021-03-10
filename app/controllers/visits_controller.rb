class VisitsController < ApplicationController
    before_action :authenticate, only: [:show, :update, :create, :destroy,:destroy_image]
    def index
        @visits = Visit.all
        render json: @visits
    end

    def create
        @visit = Visit.create(visit_params)
        render json: @visit
    end

    def reviews
        @visits = Visit.where(code: params[:code])
        render json: @visits
    end

    def update
        @visit= Visit.find(params[:id])
        @visit.update(visit_params)
        render json: @visit
    end
  
    def destroy
        @visit= Visit.find(params[:id])
        @visit.destroy
    end

    def destroy_image
        image = ActiveStorage::Blob.find_signed(params[:signed_id])
        image.attachments.first.purge
    end

    private
    def visit_params
        params.permit(:review, :user_id, :code, :score, :journal, images: [])
    end
end