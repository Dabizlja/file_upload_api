Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      post "/files", to: "attachments#create"
      get "files/:tag_search_query/:page", to: "attachments#tag_search"
    end
  end
end
