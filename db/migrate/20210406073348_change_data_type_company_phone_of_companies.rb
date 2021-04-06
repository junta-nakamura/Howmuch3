class ChangeDataTypeCompanyPhoneOfCompanies < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :company_phone, :string
  end
end
