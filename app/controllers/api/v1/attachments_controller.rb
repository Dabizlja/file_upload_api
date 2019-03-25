class Api::V1::AttachmentsController < ApplicationController  
  def create
    filter_tag_list(params[:tag_list])
    attachment = Attachment.new(attachment_params)
    
    if attachment.save
      render json: { uuid: attachment.id }, status: :created
    else
      render json: { errors: attachment.errors }, status: :unprocessable_entity
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name, :tag_list => [])
  end
end
