class Company < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages, dependent: :destroy
  has_many :rooms
  belongs_to :prefecture
  has_one_attached :company_image

  with_options presence: true do
    validates :company_name
    validates :company_phone
    validates :prefecture_id
    validates :municipalities
    validates :house_number
  end

  POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX

  # COMPANY_PHONE_REGEX = /\A\d{10}\z/
  # validates_format_of :company_phone, with: COMPANY_PHONE_REGEX
  
end
