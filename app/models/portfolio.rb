class Portfolio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :type
  has_many_attached :images

  with_options presence: true do
    validates :portfolio_name
    validates :detail
    validates :type_id
    validates :development_language
    validates :business_type
    validates :sale_type
  end
    
  validates :price, presence: true, if: :sale_type?

  def sale_type?
    self.sale_type == 0
  end
  
  def self.search(word,development_language,business_type,sale_type,price)
    if word.blank?
      word = ""
    else
      word = word
    end

    if development_language.blank?
      dl = 1..21
    else
      dl = development_language
    end

    if business_type.blank?
      bt = 1..3
    else
      bt = business_type
    end

    if sale_type.blank?
      st = 0..1
    else
      st = sale_type
    end 

    if sale_type == 0 && price.present?
      pr = "price: price"
    elsif sale_type == 0 && price.blank?
      pr = "'price<=?', 999999"
    else
      pr = "price: nil"
    end

    if word.blank? && development_language.blank? && business_type.blank? && sale_type.blank? && price.blank?
      @portfolio = Portfolio.all
    else
      @portfolio = Portfolio.where("detail LIKE(?)", "%#{word}%").where(development_language: dl).where(business_type: bt).where(sale_type: st).where(pr)
      binding.pry
    end
  end
end
