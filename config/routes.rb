Rails.application.routes.draw do
  
  get 'about/home'

  get 'about/news'

  get 'about/organization'

  get 'about/history'

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions"}

  mount Ckeditor::Engine => '/ckeditor'

  resources :index_posts
  resources :workshops
  resources :galleries

  
  resources :courses 

  #routes for image deletion
  resources :course_images,  only: [:destroy]
  resources :index_post_images, only: [:destroy]
  resources :gallery_images, only: [:create, :destroy]
  resources :topic_images, only: [:create, :destroy]
  resources :workshop_images, only: [:create, :destroy]

  resources :teachers, only: [:index, :show]

  #blog post topics
  resources :topics 

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get "/admin", to: "admin#index"
  get "/admin/courses", to: "admin#courses"
  get "/admin/galleries", to: "admin#galleries"
  get "/admin/index_pages", to: "admin#index_pages"
  get "/admin/news_topics", to: "admin#news_topics"
  get "/admin/workshops", to: "admin#workshops"
  get "/admin/users", to: "admin#users"

  post "admin/confirm_user" => "admin#confirm_user"
  
  get 'about' => 'welcome#about'
  get 'index' => 'welcome#index'
  get '/' => 'intro#intro'

  root 'welcome#index'

end
