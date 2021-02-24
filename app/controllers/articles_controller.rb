class ArticlesController < ApplicationController
    
    def create
        redirect_to articles_path
    end
    def show
    @articles = Article.joins(:comments).group("article_id").order("COUNT(comments.id) DESC").limit(5)
    # @articles = Article.all.max_by(5){|article| article.comments.length}
    end

    def index
        # byebug
        Api.load_data
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
end