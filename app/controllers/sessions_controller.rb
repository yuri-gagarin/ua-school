class SessionsController < Devise::SessionsController

    def after_sign_in_path_for(resource)
        if  resource.role == "admin"
        "/admin"
        else
        "/index"
        end
    end

    def after_sign_out_path_for(resource)
        "/index"
    end
end
