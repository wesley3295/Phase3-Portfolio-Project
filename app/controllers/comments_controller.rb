class CommentsController < ApplicationController
    
        before_action :find_comment, only: [:edit,:update,:destroy]
        before_action :find_article, only: [:new,:create,:index,:edit,:update,:destroy]
        before_action :bad_sources, only: [:index,:create]
        before_action :authenticate_user_of_comment, only: [:edit]
        before_action :article_exists?, only: [:new,:edit]
        before_action :comment_exists?, only: [:edit]
        
        def new
            
            @comment = Comment.new
        end
    
        def create
            @comment = Comment.new(comment_params)
           @reply = Reply.new
            if !current_user
                flash[:error] = "You must be logged in to make a new comment."
                redirect_to new_user_session_path
            elsif
                @comment.user_id = current_user.id
                @comment.article_id = @article.id
                    if  @comment.save
                        redirect_to article_comments_path(@article)
                    else
                        render '/comments/index'
                    end
            end
        end

        # If you add _path or _url to any of the names under "Prefix", you'll have the helper for that route. ex.) author_post_path(author_id, post_id)
        def index
            if @article
                @comment = Comment.new
                @reply = Reply.new
            else
              redirect_to articles_path
            end
        end
    
        def edit
        end
    
        def update
            if @comment.update(comment_params)
                redirect_to article_comments_path(@article)
            else
                render :edit          
            end
        end
    
        def destroy
            @comment.delete
            redirect_to article_comments_path(@article)
        end

        private

        def find_comment
            @comment = Comment.find_by_id(params[:id])
        end
    
        def comment_params
            params.require(:comment).permit(:content, :article_id)
        end
 
        
       
end
