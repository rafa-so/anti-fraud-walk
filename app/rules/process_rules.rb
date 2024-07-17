class ProcessRules

  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    @transaction = TransactionRepeatedRule.new(@transaction).perform
    @transaction = TooManyAttemptsRule.new(@transaction).perform if @transaction.approved
    @transaction = UserIsChargebackedRule.new(@transaction).perform if @transaction.approved

    @transaction
  end
end
