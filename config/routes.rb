Rails.application.routes.draw do

## deviseで作成されたルート
	devise_for :users
	# 中身
		# ## devise/sessions
		# get '/users/sign_in' => 'devise/sessions#new', as: 'new_user_session'
		# post '/users/sign_in' => 'devise/sessions#create', as: 'user_session'
		# delete '/users/sign_out' => 'devise/sessions#destroy', as: 'destroy_user_session'
		# get '/users/password/new' => 'devise/passwords#new', as: 'new_user_password'
		# get '/users/password/edit' => 'devise/passwords#edit', as: 'edit_user_password'
		# patch '/users/password' => 'devise/passwords#update', as: 'user_password'
		# put '/users/password' => 'devise/password#update' #No name
		# post '/users/password' => 'devise/passwords#create' #No name
		# ## devise/registrations
		# get '/users/cancel' => 'devise/registrations#cancel', as: 'cancel_user_registration'
		# get '/users/sign_up' => 'devise/registrations#new', as: 'new_user_registration'
		# get '/users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
		# patch '/users' => 'devise/registrations#update', as: 'user_registration'
		# put '/users' => 'devise/registrations#update' #No name
		# delete '/users' => 'devise/registrations#destroy'
		# post '/users' => 'devise/registrations#create'
		# ## devise以外の基幹機能
		# # 省略
## ログイン成功後、rootへ飛ぶので、任意の画面に設定
	root 'post_images#index'

	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
		resource :post_comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
	end

	# 中身
		# get '/post_images' => 'post_images#index', as: 'post_images'
		# post '/post_images' => 'post_images#create' #No name
		# get '/post_images/new' => 'post_images#new', as: 'new_post_image'
		# get '/post_images/:id' => 'post_images#show', as: 'post_image'
		# delete '/post_images/:id' => 'post_images#destroy'
			# post '/post_images/:post_image_id/post_comments' => 'post_comments#create'
			# delete '/post_images/:post_image_id/post_comments' => 'post_comments#destroy', as: 'post_image_post_comments'

	resources :users, only: [:show, :edit, :update]
		# get '/users/:id' => 'users#show', as: 'user'
		# get '/users/:id/edit' => 'users#edit', as: 'edit_user'
		# patch '/users/:id' => 'users#update'
		# put '/users/:id' => 'users#update'


end
