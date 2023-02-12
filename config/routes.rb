Rails.application.routes.draw do
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 # user側ルーティング
  scope module: 'public' do
    root 'homes#top'
    resources :reviews
    get 'users/my_page' => 'users#show'
    patch 'users/update' => 'users#update'
    get 'users/edit' => 'users#edit'
    resources :tags, only: [:show]
  end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # admin側ルーティング
  namespace :admin do
    get 'admin' => 'admin#top'
    resources :users, only: [:index, :edit, :update, :show]
    resources :tags, only: [:index, :create, :edit, :update]
    resources :reviews, only: [:show, :index, :new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
