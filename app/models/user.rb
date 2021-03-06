class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
        
  has_many :comments, dependent: :delete_all
  has_many :articles, through: :comments
  has_many :replies
  has_many :subscriptions

  accepts_nested_attributes_for :subscriptions
 

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth[:info][:email].split("@")[0]
      user.first_name = auth[:info][:name].split[0]
      user.last_name = auth[:info][:name].split[1]
      user.password = Devise.friendly_token[0,20]
    end      
  end

end
