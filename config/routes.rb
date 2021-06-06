# frozen_string_literal:true

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

# Admin routes
Rails.application.routes.draw do
  root to: 'movies#index'
  resources :movies

  # Api routes
  namespace :api, default: { format: :json } do
    namespace :user, default: { format: :json } do
      draw :user_routes
    end
    namespace :product, default: { format: :json } do
      draw :product_routes
    end
  end
end
