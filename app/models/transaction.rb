class Transaction < ApplicationRecord
  class RuleError < StandardError; end

  scope :chargebacked, -> { where(chargebacked: true) }
  validates :external_id, uniqueness: true

  def approval_label
    approved ? 'approved' : 'deny'
  end
end
