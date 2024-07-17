class UserTooManyRule
  def initialize(transaction)
    @transaction = transaction
  end

  def perform
    false
  end
end
