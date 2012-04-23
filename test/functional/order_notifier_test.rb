require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match mail.body.encoded, /1 x Programming Ruby 1.9/
  end

  test "shipped" do
    mail = OrderNotifier.shipped
    assert_equal "Shipped", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
