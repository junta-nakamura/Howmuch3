class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :company_messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
