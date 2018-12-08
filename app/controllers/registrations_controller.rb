class RegistrationsController < Devise::RegistrationsController

    def destroy
        if resource.role == "admin"
            user = User.find(params[:user_id])
            User.destroy(user.id)
            redirect_to controller: :admin, action: :index
        else
            super
        end

    end

    
    private
    def sign_up_params
        params.require(:user).permit( :name, :last_name, :email, :password, :password_confirmation, :role, :avatar)
    end

    def account_update_params
        params.require(:user).permit( :name, :last_name, :email, :password, :password_confirmation, :current_password,  :role, :avatar)
    end
end