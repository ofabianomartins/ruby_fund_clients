class Fund < ApplicationRecord
  has_many :investment_redemption_transactions
  alias_attribute :investment_redemption_transactions, :transactions

  def self.funds_balance
    #   SELECT f.name, SUM(value) FROM investment_redemption_transations i INNER JOIN fund f ON i.fund_id = f.id GROUP BY f.name;
    # result = InvestmentRedemptionTransaction.joins(:fund).group('f.name').select('f.name, SUM(value) as balance')
    #   ActiveRecord
    result = InvestmentRedemptionTransaction.joins(:fund)
    result = result.group('funds.name')
    result = result.select('funds.name as name, SUM(value) as balance')
    resultFunction = {}
    result.each do |r|
      resultFunction[r.name] = r.balance
    end
    resultFunction
  end

  def as_json(_options)
    {
      only: %i[
        id
        name
      ]
    }
  end
end
