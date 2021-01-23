class CommentsController < ApplicationController
    
        before_action :find_comment, only: [:show, :edit, :update, :destroy]
        
        def new
            @comment = Comment.new
        end
    
        def create
            comment = Comment.new(comment_params)
           article = comment.article
           comment.user_id = current_user.id
         
            if comment.save
            redirect_to article_path(article)
            else
                 render '/articles/show'
            end
        end
    
        # def show
    
        # end
    
        def index
            if params[:article_id]
              @comments = Article.find(params[:article_id]).comments     #<-----NOW WE CAN NEST IN commentsCONTROLLER INSTEAD OF articleS CONTROLLER
            else
              @comments = Post.all
            end
          end
    
        def edit
    
        end
    
        def update
            if @comment.update
                redirect_to comment_path(@comment)
            else
                render :new           
                
            end
        end
    
        def delete
            @comment.delete
            redirect_to :new
        end
    
        private
        def find_comment
            @comment = Comment.find_by_id(params[:id])
        end
    
        def comment_params
            params.require(:comment).permit(:content, :article_id)
        end
    
   
end
