class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string     :portfolio_name, null: false
      t.text       :detail,         null: false
      t.integer    :type_id,        null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
