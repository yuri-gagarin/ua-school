class AdminController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin
    def index
        @users = User.all
        @courses = Course.all
        @index_posts = IndexPost.all
    end

    def confirm_user
        @user_id = params[:user_id]
        puts @user_id
    end
end
