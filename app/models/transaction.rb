class Transaction < ApplicationRecord

  scope :from_external_id, -> (external_id) { where(external_id: external_id) }
  scope :from_user, -> (user_id) { where(user_id: user_id) }
  scope :chargebacked, -> { where(chargebacked: true) }

  validates :external_id, presence: { message: "Required field" }

  def approval_label
    self.approved ? 'approved' : 'deny'
  end

  def approve
    self.approved = true
  end

  def deny
    self.approved = false
  end
end
