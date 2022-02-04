class RenameInvestmentRedemptionTrasancionsInvestmentRedemptionTransactions < ActiveRecord::Migration[7.0]
  def change
    rename_table :investment_redemption_trasanctions, :investment_redemption_transactions
  end
end
