class Api::V1::AttachmentsController < ApplicationController  
  def create
    attachment = Attachment.new(attachment_params)
    
    if attachment.save
      render json: { uuid: attachment.id }, status: :created
    else
      render json: { errors: attachment.errors }, status: :unprocessable_entity
    end
  end

  def tag_search
    search_array = search_by(params[:tag_search_query])
    @records = Attachment.tagged_with(search_array, :any => true)
    @related_records = Attachment.tagged_with(search_array, :exclude => true)
    render 'api/v1/attachments/index.json.jbuilder', status: :ok
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name, :tag_list => [])
  end
end
