class User < ApplicationRecord
  def is_denied?
    deny
  end
end
