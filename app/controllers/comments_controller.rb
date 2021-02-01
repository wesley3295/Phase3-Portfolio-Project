class CommentsController < ApplicationController
    
        before_action :find_comment, only: [:show, :edit, :update, :destroy]
        before_action :find_article, only: [:index, :new, :create,:destroy,:update]
        before_action :article_comments, only: [:index]
        before_action :bad_sources, only: [:index,:create]
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
                    if  @comment.save
                        redirect_to article_comments_path(@article)
                    else
                        render :index
                    end
            end
        end

        # If you add _path or _url to any of the names under "Prefix", you'll have the helper for that route. ex.) author_post_path(author_id, post_id)
        def index
            if @article
                @comment = Comment.new
                @reply = Reply.new
            else
              @comments = Comment.all
            end
          end
    
        def edit
           @article = @comment.article
        end
    
        def update
            if @comment.update(comment_params)
                redirect_to article_comments_path(article)
            else
                render :edit          
            end
        end
    
        def destroy
            # article = @comment.article
            @comment.delete
            redirect_to article_comments_path(article)
        end
    
        private
        def bad_sources
            @bad_sources = ["CNBC","CNN Europe","Engadget","Fansided","Financial Post | Canada Business News","Forbes","Seeking Alpha","Sports Illustrated","Sports | Reddit", "The Verge","Yardbarker.com","business","dailynorthwestern","dennews","deseretnews","euroweeklynews","hitfix","indybay","nationalpost","newswithviews","si","stylecaster","suntimes","thestar","tmz","torontosun","tribune242","vancouversun","wwd"]
        end

        def find_article
            @article = Article.find_by(params[:article_id])
        end

        def article_comments
            @comments= @article.comments if @article
        end

        def find_comment
            @comment = Comment.find_by_id(params[:id])
        end
    
        def comment_params
            params.require(:comment).permit(:content, :article_id)
        end
    
   
end
