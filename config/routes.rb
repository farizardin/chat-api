Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/chat", to: "chat#index"
  get "/chat/open", to: "chat#open_conversation"
  post "/chat/send", to: "chat#send_message"
  post "/register", to: "user#create"
  post "/login", to: "auth#login"
end
