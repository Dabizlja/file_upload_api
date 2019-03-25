require "rails_helper"

RSpec.describe "Attachment management", type: :request do 
  it "should create new file" do 
    post "/api/v1/files", params: { attachment: { name: "File1", tag_list: ["test1", "test2"]  } }
    expect(response).to have_http_status(:created)
  end

  it "should return errors if name is blank" do 
    post "/api/v1/files", params: { attachment: { name: "" } }
    expect(response).to have_http_status(:unprocessable_entity)
    expect(json["errors"]["name"]) == "can't be blank"
  end
end