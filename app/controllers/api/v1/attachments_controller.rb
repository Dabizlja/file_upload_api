class Api::V1::AttachmentsController < ApplicationController
  def create
    attachment = Attachment.new(attachment_params)

    if attachment.save
      render json: { uuid: attachment.id }, status: :created
    else
      render json: { errors: attachment.errors }, status: :unprocessable_entity
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name)
  end
end
