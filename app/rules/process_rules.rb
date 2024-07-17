class ProcessRules
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    controll = OpenStruct.new(processed: true, approved: false)

    if TransactionAlreadySavedRule.new(@transaction).perform
      controll.approved = true
    end

    @transaction.processed = controll.processed
    @transaction.approved = controll.approved

    @transaction
  end
end
