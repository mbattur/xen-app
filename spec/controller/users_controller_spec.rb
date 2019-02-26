require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#pay_credit_card' do
    let(:user) { create(:stack_account).user }

    it 'pays credit cards' do
      sign_in user
      # get :pay id: card.id

      # expect(response.status).to be(:success)
      resp = subject.stack_account_remaining
      puts JSON.pretty_generate(resp)
      expect(resp).to eq(667.0)
    end
  end

  describe '#pay_smallest_cards' do
    let(:user) { create(:credit_card_debt).user }

    it 'pays credit cards' do
      sign_in user
      # get :pay id: card.id

      # expect(response.status).to be(:success)
      resp = subject.pay_smallest_cards
      puts JSON.pretty_generate(resp)
      expect(resp).not be_nil
    end
  end
end
