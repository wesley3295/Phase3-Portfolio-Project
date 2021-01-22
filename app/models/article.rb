class Article < ApplicationRecord
    has_many :article_comments
    has_many :comments, through: :article_comments
    # has_many :users, through: :comments
    validates :title, uniqueness: true
    accepts_nested_attributes_for :comments
    paginates_per 20
# validate :article_unique

# def  article_unique
   
#     @article = Article.find_or_create_by(title: :data['title'])
#     errors.add(:title, 'Duplicate Articles Were Avoided' )
# end
def self.by_source(source)
    where(source: source)
end 
end
