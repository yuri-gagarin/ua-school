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

    def index_pages
        @index_pages = IndexPost.all
    end

    def news_topics
        @topics = Topic.all
    end

    def workshops
        @workshops. Workshop.all
    end

    def users
        @users = User.all
        @teachers = User.where(role: 'teacher')
        @students = User.where(role: 'student')
        @parents = User.where(role: 'parent')
    end



    def confirm_user
        @user_id = params[:user_id]
        puts @user_id
    end
end
