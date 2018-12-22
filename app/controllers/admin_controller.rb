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
        @courses = Course.all 
    end

    def galleries
        @galleries = Gallery.all
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
        @topics = Topic.all
    end

    def workshops
        @workshops = Workshop.all
    end

    def administrators
        @administrators = User.where(role: 'admin')
    end

    def parents
        @parents = User.where(role: 'member')
    end

    def posts 
        @posts = Post.all
    end

    def students
        @students = User.where(role: 'student')
    end

    def sponsored_posts
        @sponsored_posts = SponsoredPost.all
    end

    def teachers
        @teachers = User.where(role: 'teacher')
    end



    def confirm_user
        @user_id = params[:user_id]
        puts @user_id
    end
end
