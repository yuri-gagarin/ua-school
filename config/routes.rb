Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", locale: /en|uk/ do

    devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions"}

    #routes for image creation and deletion
    resources :course_images,  only: [:create, :destroy]
    resources :index_post_images, only: [:create, :destroy]
    resources :gallery_images, only: [:create, :destroy]
    resources :grade_images, only: [:create, :destroy]
    resources :topic_images, only: [:create, :destroy]
    resources :school_info_images, only: [:create, :destroy]
    resources :workshop_images, only: [:create, :destroy]
    


    resources :grades
    resources :courses 
    resources :galleries
    resources :workshops
    resources :school_infos


    #blog post topics
    resources :topics 

    resources :index_posts, only: [:index, :new, :create]
    resources :index_posts, except: [:index, :new, :create]
    #get '*id', to: 'index_posts#show'


    resources :teachers


    get 'about/home'
    get 'about/news'
    get 'about/organization'
    get 'about/history'

    get "/admin", to: "admin#index"
    get "/admin/administrators", to: "admin#administrators"
    get "/admin/courses", to: "admin#courses"
    get "/admin/galleries", to: "admin#galleries"
    get "/admin/general_info", to: "admin#general_info"
    get "/admin/grades", to: "admin#grades"
    get "/admin/index_posts", to: "admin#index_posts"
    get "/admin/news_topics", to: "admin#news_topics"
    get "/admin/workshops", to: "admin#workshops"
    get "/admin/parents", to: "admin#parents"
    get "/admin/posts", to: "admin#posts"
    get "/admin/sponsored_posts", to: "admin#sponsored_posts"
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
