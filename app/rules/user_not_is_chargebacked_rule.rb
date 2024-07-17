class UserNotIsChargebackedRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    current_user = @transaction.user_id
    transactions = Transaction.from_user(current_user).chargebacked
    !transactions.present?
  end
end
