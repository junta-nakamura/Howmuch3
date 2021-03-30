class AddColumnsToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :development_language, :integer, null: false
    add_column :portfolios, :price, :integer
    add_column :portfolios, :business_type, :integer, null: false
    add_column :portfolios, :sale_type, :integer, null: false
  end
end 