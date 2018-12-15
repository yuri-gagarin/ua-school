class RegistrationsController < Devise::RegistrationsController

    def destroy
        if resource.role == "admin"
            user = User.find(params[:user_id])
            User.destroy(user.id)
            redirect_to :back
        else
            super
        end

    end

    def update 
        if params[:user_image]
            resource.create_user_image(image: params[:user_image])
        end
        super
    end

    def sign_up_params
        params.require(:user).permit( :name, :last_name, :email, :password, :password_confirmation, :role, :avatar)
    end

    def account_update_params
        params.require(:user).permit( :name, :last_name, :email, :password, :password_confirmation, :current_password,  :role, :avatar)
    end

    protected

    def build_resource(hash = {})
        self.resource = resource_class.new_with_session(hash, session)
    end

end