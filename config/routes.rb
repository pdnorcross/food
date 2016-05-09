Rails.application.routes.draw do
  root 'persons#index'

  resources :persons do
    collection do
      post :import
      get :ar
      get :vt
      get :la
      get :ma
      get :large_comp
      get :ffr
      get :groc
    end
  end
end
