Rails.application.routes.draw do
  
  

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions"}

  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", locale: /en|uk/ do


    #routes for image deletion
    resources :course_images,  only: [:destroy]
    resources :index_post_images, only: [:destroy]
    resources :gallery_images, only: [:create, :destroy]
    resources :topic_images, only: [:create, :destroy]
    resources :workshop_images, only: [:create, :destroy]

    resources :courses 
    resources :galleries
    resources :workshops
    #blog post topics
    resources :topics 

    resources :index_posts, only: [:index, :new, :create]
    resources :index_posts, except: [:index, :new, :create]
    #get '*id', to: 'index_posts#show'


    resources :teachers, only: [:index, :show]


    get 'about/home'
    get 'about/news'
    get 'about/organization'
    get 'about/history'

    get "/admin", to: "admin#index"
    get "/admin/courses", to: "admin#courses"
    get "/admin/galleries", to: "admin#galleries"
    get "/admin/index_posts", to: "admin#index_posts"
    get "/admin/news_topics", to: "admin#news_topics"
    get "/admin/workshops", to: "admin#workshops"
    get "/admin/parents", to: "admin#parents"
    get "/admin/students", to: "admin#students"
    get "/admin/teachers", to: "admin#teachers"

    post "admin/confirm_user" => "admin#confirm_user"
  
    get 'about' => 'welcome#about'
    get 'index' => 'welcome#index'
    get '/' => 'intro#intro'

    root 'welcome#index'

  end

  

  

  

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  

end
