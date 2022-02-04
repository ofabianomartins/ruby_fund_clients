require "rails_helper"

describe FundsController, type: :controller do 
  describe '#POST /funds' do
    context 'when all params are passed correctly' do 
      it 'expect que Fund.count increase by 1 ' do
        expect do 
          post :create, format: :json, params: {
            fund: {
              name: "MEEEEU FUNDO",
              creation_date: "2022-02-04"
            }
          }
          expect(response).to have_http_status(201)
        end.to change{ Fund.count }.by 1 
      end
    end
  end
end
