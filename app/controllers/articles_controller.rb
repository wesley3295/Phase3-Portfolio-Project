class ArticlesController < ApplicationController
    # before_action :find_article, only: [:show] #:edit, :update, :destroy]
    
    # def new
    #     @article = Article.new
    # end
    
    def create
        redirect_to articles_path
    end

    def show
        find_article
        @comment = Comment.new
        @reply = Reply.new
        
    end

    def index
       
        # Api.load_data
       @comment = Comment.new
       if !params[:source].blank?
        articles = Article.by_source(params[:source])
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
    else
        articles = Article.all.sort_by(&:published_at).reverse
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
    end
    end

    # def edit

    # end

    # def update
    #     find_article
        
    #     if @article.update(article_params)
          
    #         redirect_to articles_path
            
    #     # else
    #         # render :show           
    #         end
    # end

    # def delete
    #     @article.delete
    #     redirect_to :new
    # end

    private
    def find_article
        @article = Article.find_by_id(params[:id])
    end

    def article_params
        params.require(:article).permit(comment_attributes: [:content])
    end
end