class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :articles, through: :comments
  has_many :replies
  has_many :subscriptions
  accepts_nested_attributes_for :subscriptions

  # has_secure_password
end
