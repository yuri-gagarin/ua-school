class AdminController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin
    def index
        @users = User.all
        @courses = Course.all
        @index_posts = IndexPost.all
        @workshops = Workshop.all
    end

    def courses
        @courses = Course.paginate(page: params[:page], per_page: 10)
    end

    def galleries
        @galleries = Gallery.paginate(page: params[:page], per_page: 10)
    end

    def grades
        @grades = Grade.order(level: "ASC")
    end

    def general_info
        @school_info_pages = SchoolInfo.all
    end

    def index_posts
        @index_posts = IndexPost.all
    end

    def news_topics
        @topics = Topic.paginate(page: params[:page], per_page: 10)
    end

    def workshops
        @workshops = Workshop.paginate(page: params[:page], per_page: 10)
    end

    def administrators
        @administrators = User.where(role: 'admin').paginate(page: params[:page], per_page: 10)
    end

    def parents
        @parents = User.paginate(page: params[:page], per_page: 10)
    end

    def posts 
        @posts = Post.paginate(page: params[:page], per_page: 10)
    end

    def students
        @students = User.where(role: 'student').paginate(page: params[:page], per_page: 10)
    end

    def sponsored_posts
        @sponsored_posts = SponsoredPost.paginate(page: params[:page], per_page: 10)
    end

    def teachers
        @teachers = User.where(role: 'teacher').paginate(page: params[:page], per_page: 10)
    end



    def confirm_user
        @user_id = params[:user_id]
        puts @user_id
    end
end
