Rails.application.routes.draw do
  resources :categoria 
  get "/study_items/all", to: "study_items#see_items"
  get "/study_items/search", to: "study_items#search"
  root to: "study_items#index"

  resources :study_items do 
    resources :comments
    post 'mark_as_done', on: :member
  end
end
