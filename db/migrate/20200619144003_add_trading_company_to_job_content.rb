class AddTradingCompanyToJobContent < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_contents, :trading_company, foreign_key: true
  end
end
