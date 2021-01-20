class ArticlesController < ApplicationController
    before_action :find_article, only: [:show] #:edit, :update, :destroy]
    
    # def new
    #     @article = Article.new
    # end

    # def create
    #     @article= Article.new(article_params)
    # end

    def show

    end

    def index
        Api.load_data
        articles = Article.all.sort_by(&:published_at).reverse
       @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
         
    end

    # def edit

    # end

    # def update
    #     if @article.update
    #         redirect_to article_path(@article)
    #     else
    #         render :new           
    #         end
    #     end
    # end

    # def delete
    #     @article.delete
    #     redirect_to :new
    # end

    private
    def find_article
        @article = Article.find_by_id(:id)
    end

    # def article_params
    #     params.require(:article).permit()
    # end
end