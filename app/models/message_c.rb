class MessageC < ApplicationRecord
  validates :content, presence: true
  belongs_to :company
  belongs_to :room
end
