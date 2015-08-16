class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :update, :destroy]

  # GET /camps
  # GET /camps.json
  def index
    @camps = Camp.all

    render json: @camps
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
    render json: @camp
  end

  # POST /camps
  # POST /camps.json
  def create
    @camp = Camp.new(camp_params)

    if @camp.save
      render json: @camp, status: :created, location: @camp
    else
      render json: @camp.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    @camp = Camp.find(params[:id])

    if @camp.update(camp_params)
      head :no_content
    else
      render json: @camp.errors, status: :unprocessable_entity
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy

    head :no_content
  end

  private

    def set_camp
      @camp = Camp.find(params[:id])
    end

    def camp_params
      params.require(:camp).permit(:name)
    end
end
