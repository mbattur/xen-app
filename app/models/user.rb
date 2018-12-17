class User < ApplicationRecord
  has_many :consumer_debts, dependent: :destroy
  has_many :credit_card_debts, dependent: :destroy
  has_many :questions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
