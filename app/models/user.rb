class User < ApplicationRecord
  has_many :consumer_debts, dependent: :destroy
  has_many :credit_card_debts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_one :stack_account, dependent: :destroy
  has_one :small_emergency, dependent: :destroy
  has_one :big_emergency, dependent: :destroy
  has_one :retirement_account, dependent: :destroy
  has_one :mortgage_account, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
