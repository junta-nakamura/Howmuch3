class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms
  belongs_to :prefecture
end
