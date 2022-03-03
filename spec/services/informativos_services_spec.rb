require 'rails_helper'

describe InformativosService, type: :service do
  describe '.import_stocks' do
    context 'when a api is available' do
      before do
        stub_request(:get, %r{/securities\?security_types%5B%5D=STOCK})
          .to_return(
            status: 200,
            body: fixture('informativos/stock_response.json')
          )
      end
      it 'expect to import more than one stock' do
        expect do
          subject.import_stocks
          # InformativosService.new.import_stocks
          expect(Security.first.symbol).to eq('LAVV3')
        end.to change(Security, :count).by 1
      end
    end
  end
end
