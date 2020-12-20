Rails.application.routes.draw do
  resources :categoria 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/study_items/all" => "study_items#see_items"
  get "/study_items/search" => "study_items#search"
  get "/study_items/:id/comment" => "study_items#comment", as: :study_item_comment
  root "study_items#index"

  resources :study_items do 
    post 'mark_as_done', on: :member
  end
end
