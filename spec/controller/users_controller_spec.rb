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

  describe '#pay_each_debts' do
    let(:user) { create(:stack_account).user }
    let(:cards) do
      [
        create(:credit_card_debt),
        create(:credit_card_debt)
      ]
    end
    let(:expected) { 150 }

    it 'zzz' do
      sign_in user
      expect(subject.pay_each_debt(cards)).to eq(expected)
    end
  end

  describe '#pay_smallest_debts' do
    let(:user) { create(:stack_account).user }
    let(:card_debts) do
      [
        create(:credit_card_debt),
        create(:credit_card_debt)
      ]
    end
    let(:expected) do
      []
    end

    it 'pays credit cards' do
      sign_in user
      resp = subject.pay_smallest_debts(card_debts)
      expect(resp).to eq(expected)
    end
  end
end
