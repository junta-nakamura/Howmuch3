class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :rooms
  has_one_attached :image
end
