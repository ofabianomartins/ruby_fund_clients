FactoryBot.define do
  factory :investment_redemption_transaction do
    date { Date.today }
    value { 100 }
    client
    fund
  end
end
