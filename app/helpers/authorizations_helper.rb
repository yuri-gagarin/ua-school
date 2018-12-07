module AuthorizationsHelper
    

    def authorize_admin
        if current_user && current_user.admin?
            true
        else 
            redirect_to(new_user_session_path)
        end
    end

end