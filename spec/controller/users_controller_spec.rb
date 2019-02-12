require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#pay_credit_card' do
    def setup
      sign_in FactoryBot.create(:user)
    end

    it 'pays credit cards' do
      sign_in user
      resp = subject.pay_credit_card
      puts JSON.pretty_generate(resp)
      expect(resp).not_to be_nil
    end
  end
end
