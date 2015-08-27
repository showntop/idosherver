class Admin::IdentitiesController < ApplicationController
  before_action :set_identity, only: [:show, :update, :destroy]

  # GET /admin/identities
  # GET /admin/identities.json
  def index
    @identities = Identity.all

    render json: @identities
  end

  def new
    @identity = Identity.new
  end

  # GET /admin/identities/1
  # GET /admin/identities/1.json
  def show
    render json: @identity
  end

  def edit
    render json: @identity
  end

  # POST /admin/identities
  # POST /admin/identities.json
  def create
    @identity = Identity.new(identity_params)

    if @identity.save
      render json: @identity, status: :created, location: [:admin, @identity]
    else
      render json: @identity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/identities/1
  # PATCH/PUT /admin/identities/1.json
  def update
    @identity = Identity.find(params[:id])

    if @identity.update(identity_params)
      head :no_content
    else
      render json: @identity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/identities/1
  # DELETE /admin/identities/1.json
  def destroy
    @identity.destroy

    head :no_content
  end

  private

    def set_identity
      @identity = Identity.find(params[:id])
    end

    def identity_params
      params.require(:identity).permit(:name, :logo)
    end
end
