class Merchant < ApplicationRecord
  def is_denied?
    deny
  end
end
