class TopicAttachmentsController < ApplicationController

  #before_action :set_topic_attachment, only: [:show, :update, :destroy]

  def create
    @topic_attachment = TopicAttachment.new(topic_attachment_params)

    if @topic_attachment.save
      render json: {attachment_url: @topic_attachment.attachment, uuid: @topic_attachment.uuid}, status: :created
    else
      render json: @topic_attachment.errors, status: :unprocessable_entity
    end
  end

  private

    # def set_topic_attachment
    #   @topic_attachment = TopicAttachment.find(params[:id])
    # end

    def topic_attachment_params
      params.require(:topic_attachment).permit(:attachment)
    end
end
