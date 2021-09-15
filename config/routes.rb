Rails.application.routes.draw do
  devise_for :members

  resources :members,only:[:show, :edit, :update]
  get 'menbers' => 'public/members#leave'
  patch 'members' => 'public/members#withdraw'

  resources :products,only:[:index, :show]
  root to :'public/homes#top'
  get 'homes/about' => 'public/homes#about'

  resources :cart_products,only:[:create, :update, :index, :destaroy]
  delete 'cart_products' => 'public/cart_products#destaroy_all'

  resources :orders,only:[:new, :create, :index, :show]
  post 'orders' => 'public/orders#comfirm'
  get 'orders' => 'public/orders#finish'

  resources :addresses,only:[:index, :create, :destaroy, :edit, :update]

  namespace :admin do
    devise_for :admins
    resources :members,only:[:index, :show, :edit, :update]
    resources :products,only:[:index, :new, :create, :show, :edit, :update]
    root to :'admin/homes#top'
    resources :genres,only:[:index, :create, :edit ,:update]
    resources :orders,only:[:show, :update] do
     resources :order_products,only:[:update]
    end
  end
end
