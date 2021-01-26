class SessionsController < ApplicationController

    def destroy
        @user = User.find_by_id(params[:id])
        session.destroy
        redirect_to articles_path
    end

    def new
        
    end
end