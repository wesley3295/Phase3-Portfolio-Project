class Article < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    has_many :replies, through: :comments

    validates :title, uniqueness: true
    accepts_nested_attributes_for :comments
    paginates_per 20

def self.by_source(source)
    where(source: source)
end 


def self.all_sources
    Article.pluck(:source).uniq.sort
end

end
# article = Article.find_by_id(83)
# <Comment id: 9, content: "this is a new comment", article_id: 83, user_id: 1>
# reply = Reply.new(content:"1reply", user_id: 1, comment_id: 9)