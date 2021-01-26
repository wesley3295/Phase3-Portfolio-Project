class RegistrationsController <  Devise::RegistrationsController
def new
    @user = User.new
    @subscription = Subscription.new
end
    private
    
    def user_params
        params.require(:user).permit(:password, :email, :first_name, :last_name, :username, subscription_ids: [], subscription_attributes:[:source])
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end
end