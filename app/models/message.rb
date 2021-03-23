class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :room
  has_one_attached :message_image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.message_image.attached?
  end
end
