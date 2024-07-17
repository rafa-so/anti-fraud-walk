class TooManyAttemptsRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    user_attempts = TransactionHistory.from_user(@transaction.user_id).betwenn_range.count

    if user_attempts > 3
      @transaction.deny
    else
      @transaction.approve
    end

    @transaction
  end
end
