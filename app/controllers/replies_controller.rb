class RepliesController < ApplicationController
    before_action :find_reply, only: [:destroy,:update,:edit]
    before_action :bad_sources, only: [:create]

    def create
        @reply = Reply.new(reply_params)
        @comment = @reply.comment
        @article = @comment.article
        @reply.user_id = current_user.id
        if @reply.save  
        redirect_to article_comments_path(@article)#route to art/id/com/id
        else
             render '/comments/index'
        end
    end

    def edit
        @comment = @reply.comment
    end

    def update
        article = @reply.comment.article
        if @reply.update(reply_params)
            redirect_to article_comments_path(article)
        else
            render :edit
        end
    end

    def destroy
        article = @reply.comment.article
        @reply.delete
        redirect_to article_comments_path(article)
    end


    private

    def find_reply
        @reply = Reply.find_by_id(params[:id])
    end

    def reply_params
        params.require(:reply).permit(:content, :comment_id)
    end

    def bad_sources
        @bad_sources = ["CNBC","CNN Europe","Engadget","Fansided","Financial Post | Canada Business News","Forbes","Seeking Alpha","Sports Illustrated","Sports | Reddit", "The Verge","Yardbarker.com","business","dailynorthwestern","dennews","deseretnews","euroweeklynews","hitfix","indybay","nationalpost","newswithviews","si","stylecaster","suntimes","thestar","tmz","torontosun","tribune242","vancouversun","wwd"]
    end
end
