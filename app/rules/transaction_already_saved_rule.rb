class TransactionAlreadySavedRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    false
  end
end
