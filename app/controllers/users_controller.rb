class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    
    def new
        @user = User.new
    end

    def create
        @user= User.new(user_params)
    end

    def show

    end

    def index
        @users = User.all
    end

    def edit

    end

    def update
        if @user.update
            redirect_to user_path(@user)
        else
            render :new           
            end
        end
    end

    def delete
        @user.delete
        redirect_to :new
    end

    private
    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end
end
