Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      post "/files", to: "attachments#create"
    end
  end
end
