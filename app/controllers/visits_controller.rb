class VisitsController < ApplicationController
    def index
        @visits = Visit.all
        render json: @visits
    end

    def create
        @visit = Visit.create(visit_params)
        # @visit = Visit.create! (visit_params)
        # @visit.images.attach(params[:images])
        render json: @visit
    end
    private
    def visit_params
        # params.permit(:review, :user_id, :code, :score, :journal)
        params.permit(:review, :user_id, :code, :score, :journal, images: [])
        # params.permit!
    end
end