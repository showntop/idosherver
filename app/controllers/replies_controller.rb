class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    render json: @reply
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    @reply = Reply.find(params[:id])

    if @reply.update(reply_params)
      head :no_content
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy

    head :no_content
  end

  private

    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      params[:reply]
    end
end
