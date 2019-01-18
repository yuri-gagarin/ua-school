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
        @topics = Topic.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end

    def workshops
        @workshops = Workshop.paginate(page: params[:page], per_page: 10)
    end

    def administrators
        @administrators = User.where(role: 'admin').reorder(email: :asc).paginate(page: params[:page], per_page: 10)
    end

    def parents
        @parents = User.paginate(page: params[:page], per_page: 10)
    end

    def posts 
        @posts = Post.paginate(page: params[:page], per_page: 10)
    end

    def students
        @students = User.where(role: 'student').reorder(email: :asc).paginate(page: params[:page], per_page: 10)
    end

    def sponsored_posts
        @sponsored_posts = SponsoredPost.paginate(page: params[:page], per_page: 10)
    end

    def teachers
        @teachers = User.where(role: 'teacher').reorder(email: :asc).paginate(page: params[:page], per_page: 10)
    end



    def confirm_user
        @user = User.find(params[:user_id])
        @user.approved = true
        if @user.save 
            flash[:notice] = "Confirmed User"
            redirect_back(fallback_location: admin_path)
        else 
            flash[:notice] = "Error Confirming user"
            redirect_back(fallback_location: admin_path)
        end
    end

    def freeze_user
        @user = User.find(params[:user_id])
        @user.approved = false
        if @user.save 
            flash[:notice] = "Frozen User"
            redirect_back(fallback_location: admin_path)
        else
            flash[:notice] = "Error freezing user. Consider Delete"
            redirect_back(fallback_location: admin_path)
        end
    end

    private
    def user_confirm
        params.require(:user).permit(:approved)
    end
end
