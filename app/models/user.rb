class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :portfolios, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :rooms
  has_one_attached :user_image
  belongs_to :type
end
