class TransactionRepeatedRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    finded = Transaction.from_external_id(@transaction.external_id)

    if finded.present?
      @transaction.deny
    else
      @transaction.approve
    end

    @transaction
  end
end
