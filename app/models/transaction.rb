class Transaction < ApplicationRecord
  scope :from_user, -> (user_id) { where(user_id: user_id) }
  scope :chargebacked, -> { where(chargebacked: true) }

  def process_date param
    date = Time.parse(param)
    this.transaction_date = date
  end

  def approval_label
    approved ? 'approved' : 'deny'
  end
end
