class CreateInvestmentRedemptionTrasanctions < ActiveRecord::Migration[7.0]
  def change
    create_table :investment_redemption_trasanctions do |t|
      t.date :date
      t.float :value
      t.references :fund, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
    add_index :investment_redemption_trasanctions, :date
  end
end
