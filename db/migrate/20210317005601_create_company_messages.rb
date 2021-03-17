class CreateCompanyMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :message_cs do |t|
      t.text       :content, null: false
      t.references :company, foreign_key: true
      t.references :room,    foreign_key: true
      t.timestamps
    end
  end
end
