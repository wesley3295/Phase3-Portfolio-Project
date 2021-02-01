class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user
    has_many :replies, dependent: :delete_all

    validates :content, presence: true
end

