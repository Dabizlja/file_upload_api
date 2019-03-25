class Api::V1::AttachmentsController < ApplicationController  
  def create
    @attachment = Attachment.new(attachment_params)
    
    if @attachment.save
      render 'api/v1/attachments/create.json.jbuilder', status: :created
    else
      render json: { errors: @attachment.errors }, status: :unprocessable_entity
    end
  end

  def tag_search
    search_only_permitted_tags = search_permitted_tags(params[:tag_search_query])
    related_project_search = exclude_search(params[:tag_search_query])
    @records = Attachment.tagged_with(search_only_permitted_tags, :any => true).paginate page: params[:page], per_page: 10
    @related_records = ActsAsTaggableOn::Tag.where("name NOT IN (?)", related_project_search).paginate page: params[:page], per_page: 10
    render 'api/v1/attachments/tag_search.json.jbuilder', status: :ok
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name, :avatar, tag_list: [])
  end
end
