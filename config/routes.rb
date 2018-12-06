Rails.application.routes.draw do
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  devise_for :users
  root "jobs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :resumes, only: [:show]
  resources :jobs do
    post "apply", to: "applicants#create"
  end
  resources :profiles, only: [:index, :show, :edit, :update]
end
