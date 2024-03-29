require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
  # Define API
  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update] do
        resources :products, :only => [:update, :create, :destroy]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:show, :index, :destroy]
    end                
  end
end
