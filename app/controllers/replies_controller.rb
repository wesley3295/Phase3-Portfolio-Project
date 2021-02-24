class RepliesController < ApplicationController
    before_action :find_article,:find_comment, only: [:edit,:create,:update,:destroy]
    before_action :find_reply, only: [:destroy,:update,:edit]
    before_action :article_exists?,:comment_exists?,:authenticate_user_of_comment, only: [:edit]
    before_action :bad_sources, only: [:create]

    def create
        @reply = Reply.new(reply_params)
        if !current_user
            flash[:error2] = "You must be logged in to make a new reply."
            render '/comments/index'
        elsif
            @reply.comment_id = @comment.id
          @reply.user_id = current_user.id
            if  @reply.save
                redirect_to article_comments_path(@article)
            else
                render '/comments/index'
            end
        end
    end

    def edit
        if !@reply
            redirect_to article_comments_path(@article)
        end
    end

    def update
        if @reply.update(reply_params)
            redirect_to article_comments_path(@article)
        else
            render :edit
        end
    end

    def destroy
        @reply.destroy
        redirect_to article_comments_path(@article)
    end

    private
    def find_reply
        @reply = Reply.find_by_id(params[:id])
    end

    def find_comment
        @comment = Comment.find_by_id(params[:comment_id])
    end

    def reply_params
        params.require(:reply).permit(:content, :comment_id,:user_id)
    end

    
end
