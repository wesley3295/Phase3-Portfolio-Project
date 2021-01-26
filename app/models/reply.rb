class Reply < ApplicationRecord
  belongs_to :comment
  # belongs_to :user

  validates :content, presence: true

end


# #user
# has_many :comments
# has_many :articles, through: :comments
# has_many :replies

# has_secure_password