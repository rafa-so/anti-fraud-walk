class UnitDenied
  def execute(user, merchant)
    user.is_denied? || merchant.is_denied?
  end
end
