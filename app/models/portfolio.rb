class Portfolio < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :type
  belongs_to :business_type
  belongs_to :development_language
  has_many_attached :images

  with_options presence: true do
    validates :portfolio_name
    validates :detail
    validates :type_id
    validates :development_language_id
    validates :business_type_id
    validates :sale_type_id
  end
    
  validates :price, presence: true, if: :sale_type?
  validates :price, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999}


  def sale_type?
    self.sale_type_id == 0
  end
  
  def self.search(word,development_language_id,business_type_id,sale_type_id,price)
    if word.blank?
      word = ""
    else
      word = word
    end

    if development_language_id.blank?
      dl = 1..21
    else
      dl = development_language_id
    end

    if business_type_id.blank?
      bt = 1..3
    else
      bt = business_type_id
    end

    if sale_type_id.blank?
      st = 0..1
    else
      st = sale_type_id
    end 

    # if sale_type_id = 0 && price.present?
    #   pr = "price<=?', price"
    # elsif sale_type_id = 0 && price.blank?
    #   pr = "'price<=?', 999999"
    # end
    
    if word.blank? && development_language_id.blank? && business_type_id.blank? && sale_type_id.blank? && price.blank?
      @portfolio = Portfolio.all
    elsif price.blank?
      @portfolio = Portfolio.where("detail LIKE(?)", "%#{word}%").where(development_language_id: dl).where(business_type_id: bt).where(sale_type_id: st)
    else
      @portfolio = Portfolio.where("detail LIKE(?)", "%#{word}%").where(development_language_id: dl).where(business_type_id: bt).where(sale_type_id: st).where('price<=?', price)
    end
  end
end
