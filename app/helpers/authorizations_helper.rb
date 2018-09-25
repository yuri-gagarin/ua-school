module AuthorizationsHelper
    
    def authorize_admin
        current_user.admin?
    end

    def authorize_teacher
        current_user.teacher?
    end

end