class AddColumnsToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :development_language_id, :integer, null: false
    add_column :portfolios, :price, :integer
    add_column :portfolios, :business_type_id, :integer, null: false
    add_column :portfolios, :sale_type_id, :integer, null: false
  end
end 