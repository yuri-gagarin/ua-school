Rails.application.routes.draw do
  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :courses 
  resources :course_images,  only: [:destroy]
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'
  get 'index' => 'welcome#index'
  get '/' => 'intro#intro'

  root 'welcome#index'

end
