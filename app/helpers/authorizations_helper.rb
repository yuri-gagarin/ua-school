module AuthorizationsHelper
    

    def authorize_admin
        if current_user && current_user.admin?
            true
        else 
            redirect_to(root_path)
        end
    end

end