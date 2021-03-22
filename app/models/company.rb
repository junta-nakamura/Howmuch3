class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages, dependent: :destroy
  has_many :rooms
  belongs_to :prefecture
  has_one_attached :company_image
end
