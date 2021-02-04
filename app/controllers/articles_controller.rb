class ArticlesController < ApplicationController
    
    def create
        redirect_to articles_path
    end

    def index
        # byebug
        # Api.load_data
    if !params[:query].blank?
        articles = Article.search_article(params[:query])
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
    elsif !params[:source].blank?
        articles = Article.by_source(params[:source])
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
    else
        articles = Article.all.sort_by(&:published_at).reverse
        @articles = Kaminari.paginate_array(articles).page(params[:page]).per(25)
        end
    end

    private
    def find_article
        @article = Article.find_by_id(params[:id])
    end

    def article_params
        params.require(:article).permit(comment_attributes: [:content])
    end
end