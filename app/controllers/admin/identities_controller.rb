class Admin::IdentitiesController < ApplicationController
  before_action :set_admin_identity, only: [:show, :update, :destroy]

  # GET /admin/identities
  # GET /admin/identities.json
  def index
    @admin_identities = Admin::Identity.all

    render json: @admin_identities
  end

  # GET /admin/identities/1
  # GET /admin/identities/1.json
  def show
    render json: @admin_identity
  end

  # POST /admin/identities
  # POST /admin/identities.json
  def create
    @admin_identity = Admin::Identity.new(admin_identity_params)

    if @admin_identity.save
      render json: @admin_identity, status: :created, location: @admin_identity
    else
      render json: @admin_identity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/identities/1
  # PATCH/PUT /admin/identities/1.json
  def update
    @admin_identity = Admin::Identity.find(params[:id])

    if @admin_identity.update(admin_identity_params)
      head :no_content
    else
      render json: @admin_identity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/identities/1
  # DELETE /admin/identities/1.json
  def destroy
    @admin_identity.destroy

    head :no_content
  end

  private

    def set_admin_identity
      @admin_identity = Admin::Identity.find(params[:id])
    end

    def admin_identity_params
      params[:admin_identity]
    end
end
