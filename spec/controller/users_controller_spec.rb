require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#pay_credit_card' do
    let(:user) { create(:user) }

    it 'pays credit cards' do
      sign_in user
      # get :pay id: card.id

      # expect(response.status).to be(:success)
      resp = subject.stack_account_remaining
      puts JSON.pretty_generate(resp)
      expect(resp).not_to be_nil
    end
  end
end
