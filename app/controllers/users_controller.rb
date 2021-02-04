class UsersController < ApplicationController
    def show
        @user = User.find_by_id(params[:id])
        if current_user != @user
            redirect_to articles_path
        end
    end
end