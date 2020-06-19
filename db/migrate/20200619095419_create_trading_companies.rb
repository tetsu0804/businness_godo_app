class CreateTradingCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :trading_companies do |t|
      t.string :company_name, null: false
      t.string :address, null: false
      t.integer :tel, null: false, limit: 5

      t.timestamps
    end
  end
end
