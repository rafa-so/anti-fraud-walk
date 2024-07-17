class TransactionHistory < ApplicationRecord
  scope :from_user, -> (user_id) { where(user_id: user_id) }
  scope :betwenn_range, -> { where(created_at: 1.minute.ago...Time.current) }

  def self.register(transaction)
    self.create(
      transaction_id: transaction&.id,
      external_transaction_id: transaction.external_id,
      amount: transaction.amount,
      card_number: transaction.card_number,
      external_date: transaction.external_date,
      user_id: transaction.user_id,
      merchant_id: transaction.merchant_id,
      device_id: transaction.device_id,
      chargebacked: transaction.chargebacked,
      approved: transaction.approved
    )
  end
end
