Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/study_items/all" => "study_items#see_items"
  get "/study_items/search" => "study_items#search"
  root "study_items#index"

  resources :study_items , only: [:new, :create, :show, :destroy]

end
