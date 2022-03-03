require 'rails_helper'

describe Fund, type: :model do
  it 'expect 1+1 equals 2' do
    expect(1 + 1).to eq(2)
  end

  it 'expect 1+1 not be equals 3' do
    expect(1 + 1).not_to eq(3)
  end

  describe 'funds_balance' do
    context 'when db is empty' do
      it 'expect return a empty hash' do
        #        described_class ==> Fund
        #        subject         ==> Fund.new
        expect(described_class.funds_balance).to eql({})
      end
    end
    context 'when db has 3 clients, 2 funds and 3 the transactions' do
      before do
        fund1 = FactoryBot.create :fund, name: 'Fundo1'
        fund2 = FactoryBot.create :fund, name: 'Fundo2'

        client1 = FactoryBot.create :client, name: 'jose1'
        client2 = FactoryBot.create :client, name: 'jose2'
        client3 = FactoryBot.create :client, name: 'jose3'

        FactoryBot.create :investment_redemption_transaction, date: 3.days.ago, value: 500, client: client1, fund: fund1
        FactoryBot.create :investment_redemption_transaction, date: 3.days.ago, value: 500, client: client1, fund: fund2
        FactoryBot.create :investment_redemption_transaction, date: 1.days.ago, value: 647, client: client2, fund: fund1
        FactoryBot.create :investment_redemption_transaction, date: 1.days.ago, value: 770, client: client3, fund: fund2
      end

      it 'expect to return 2 funds balance' do
        result = Fund.funds_balance
        expect(result.keys.length).to eq(2)

        expect(result['Fundo1']).to be_within(0.1).of(1147.0)
        expect(result['Fundo2']).to be_within(0.1).of(1270.0)
      end
    end
  end
end
