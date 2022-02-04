class InvestmentRedemptionTransaction < ApplicationRecord
  belongs_to :client
  belongs_to :fund
end
