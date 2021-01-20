class Article < ApplicationRecord
    validates :title, uniqueness: true
    paginates_per 20
# validate :article_unique

# def  article_unique
   
#     @article = Article.find_or_create_by(title: :data['title'])
#     errors.add(:title, 'Duplicate Articles Were Avoided' )
# end
end
