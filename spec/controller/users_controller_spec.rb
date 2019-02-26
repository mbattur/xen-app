require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#pay_credit_card' do
    let(:user) { create(:stack_account).user }

    it 'pays credit cards' do
      sign_in user
      # get :pay id: card.id

      # expect(response.status).to be(:success)
      resp = subject.stack_account_remaining
      expect(resp).to eq(667.0)
    end
  end
end
