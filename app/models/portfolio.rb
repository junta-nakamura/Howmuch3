class Portfolio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :type
  has_many_attached :images

  with_options presence: true do
    validates :portfolio_name
    validates :detail
    validates :type  
  end
end
