class AdminController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin
    def index
        @users = User.all
        @course = Course.all
    end
end
