class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    # before_action :authenticate_user!
    
    def fallback
        redirect_to articles_path
    end
    
    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    def bad_sources
        @bad_sources = ["CNBC","CNN Europe","Engadget","Fansided","Financial Post | Canada Business News","Forbes","Seeking Alpha","Sports Illustrated","Sports | Reddit", "The Verge","Yardbarker.com","business","dailynorthwestern","dennews","deseretnews","euroweeklynews","hitfix","indybay","nationalpost","newswithviews","si","stylecaster","suntimes","thestar","tmz","torontosun","tribune242","vancouversun","wwd"]
    end

    def find_article
        @article = Article.find_by_id(params[:article_id])
    end
    
    def authenticate_user_of_comment
        if @comment && current_user != @comment.user
            redirect_to article_comments_path(@article)
        end
    end

    def article_exists?
        if !@article
            redirect_to articles_path
        end
    end

    def comment_exists?
        if !@comment
            redirect_to article_comments_path(@article)
        end
    end

end
