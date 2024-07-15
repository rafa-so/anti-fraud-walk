class Merchant < ApplicationRecord
  scope :found , ->(identity) { where(identity: identity) }

  def create_not_deny(params)
    self.deny = false
    self.identity = params[:identity]
    save!
  end

  def is_denied?
    deny
  end
end
