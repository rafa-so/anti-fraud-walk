class UserIsChargebackedRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    chargebacked = Transaction.from_user(@transaction.user_id).chargebacked

    if chargebacked.present?
      @transaction.deny
    else
      @transaction.approve
    end

    @transaction
  end
end
