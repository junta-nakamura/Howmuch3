class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :portfolios, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :rooms
  belongs_to :type
  has_one_attached :user_image

  with_options presence: true do
    validates :nickname, presence: true
    validates :introduction, presence: true
    validates :birthday, presence: true
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  def self.search(word)
    if word != ""
      User.where("introduction LIKE(?)", "%#{word}%")
    else
      User.all
    end
  end

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX

end
