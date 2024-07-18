require "test_helper"

class TransactionTest< ActiveSupport::TestCase
  test "transaction valid" do
    assert_not Transaction.new.valid?
  end

  test "transaction have label approved" do
    t = Transaction.new(approved: true)
    assert t.approval_label, "approved"
  end

  test "transaction should have deny label" do
    t = Transaction.new(approved: false)
    assert t.approval_label, "deny"
  end
end
