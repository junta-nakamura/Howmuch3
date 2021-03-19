class AddIntroductionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :introduction, :text, null: false
    add_column :users, :type_id, :integer, null: false
  end
end
