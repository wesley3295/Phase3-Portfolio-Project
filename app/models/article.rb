class Article < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    has_many :replies, through: :comments

    validates :title, uniqueness: true
    paginates_per 20

def self.by_source(source)
    where(source: source)
end 

def self.all_sources
    Article.pluck(:source).uniq.sort
end

def self.search_article(query)
    where('title LIKE ?', "%#{query}%")
end

end
