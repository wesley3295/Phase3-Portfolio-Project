class CommentsController < ApplicationController
    
        before_action :find_comment, only: [:show, :edit, :update, :destroy]
        before_action :find_article, only: [:index]
        before_action :article_comments, only: [:index]
        
        def new
            @comment = Comment.new
        end
    
        def create
            @comment = Comment.new(comment_params)
           @article = @comment.article
           @reply = Reply.new
           @comment.user_id = current_user.id
         
            if @comment.save
            redirect_to article_comments_path(@article)
            else
                 render :index
            end
        end
    
        def show
            
            @article = @comment.article
            if params[:article_id]
            @comments = Article.find(params[:article_id]).comments 
            @article = Article.find(params[:article_id])
            
            else 
                redirect_to article_path(@article)
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
           article = @comment.article
            if @comment.update(comment_params)
                redirect_to article_comments_path(article)
            else
                render :edit          
            end
        end
    
        def destroy
            article = @comment.article
            @comment.delete
            redirect_to article_comments_path(article)
        end
    
        private
        def find_article
            @article = Article.find(params[:article_id]) 
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
