class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :room
end
