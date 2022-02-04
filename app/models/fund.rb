class Fund < ApplicationRecord
  has_many :investment_redemption_transactions
  alias_attribute :investment_redemption_transactions, :transactions


  def as_json(options)
    ({
      only: [
        :id,
        :name
      ]
    })
  end

end
