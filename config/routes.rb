Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
}

 # user側ルーティング
  scope module: 'public' do
    root 'homes#top'
    
    resources :reviews, only: [:new, :create, :edit, :serch,:index, :show, :destroy ]do
      resources :comments, only: [:create, :destroy]  #reviewsに対してcomments子となるためネストする
    end

    patch 'reviews/:id' => 'reviews#update', as: 'update_review'
    get 'users/my_page/:id' => 'users#show', as: 'my_page'
    patch 'users/update/:id' => 'users#update', as: 'update_user'
    get 'users/edit/:id' => 'users#edit', as: 'edit_user'
    get '/users/unsubscribe/:id' => 'users#unsubscribe' , as: 'unsubscribe_user'# 退会確認画面
    patch 'users/withdrawal/:id' => 'users#withdrawal', as: 'withdrawal_user' # 退会の論理削除
    get "search_review" => "reviews#search_review"
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # admin側ルーティング
  namespace :admin do
    get 'admin' => 'admin#top'
    resources :users, only: [:index, :edit, :update, :show]
    resources :reviews, only: [:show, :index, :new, :create, :edit, :update, :destroy]do
     resources :comments, only: [:destroy]  #reviewsに対してcomments子となるためネストする
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #ゲスト用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
