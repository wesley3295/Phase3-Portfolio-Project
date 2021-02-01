class SessionsController < Devise::SessionsController

    def destroy
        @user = User.find_by_id(params[:id])
        session.destroy
        redirect_to articles_path
    end

    def new
        @user = User.new 
    end

    
    # def create
    #     @user = User.find_by_username(params[:user][:email])
    #     if @user && @user.authenticate(params[:user][:password])
    #         session[:user_id] = @user.id
    #         redirect_to articles_path
    #     else
    #         render :new
    # end
end