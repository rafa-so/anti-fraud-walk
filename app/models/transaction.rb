class Transaction < ApplicationRecord
  class RuleError < StandardError; end

  scope :from_user, -> (user_id) { where(user_id: user_id) }
  scope :chargebacked, -> { where(chargebacked: true) }
  validates :external_id, uniqueness: true

  # def initialize(params)
  #   @external_id = params[:transaction_id],
  #   @card_number = params[:card_number],
  #   @amount = params[:transaction_amount],
  #   @external_date = Time.parse(params[:transaction_date]),
  #   @device_id = params[:device_id],
  #   @user_id = params[:user_id],
  #   @merchant_id = params[:merchant_id]

  #   self
  # end

  def approval_label
    approved ? 'approved' : 'deny'
  end
end
