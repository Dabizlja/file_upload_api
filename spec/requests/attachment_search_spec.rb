require "rails_helper"

RSpec.describe "Tag search functionality" do 
  before(:each) do
    attachment = create_list(:attachment, 25)
  end

  it "should return all files with music tag" do 
    get "/api/v1/files/+music-funny/1"
    expect(json["records"].length).to eq(10)
  end

  it "should return 5 records on 3rd page" do 
    get "/api/v1/files/+music-funny/3"
    expect(json["records"].length).to eq(5)
  end
end