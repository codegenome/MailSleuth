require 'test_helper'

class MailSleuthObserverTest < ActionMailer::TestCase

  fixtures :users

  def teardown
    ActionMailer::Base.deliveries.clear
  end

  def test_sending_welcome_message
    joe = users(:joe)

    Notifier.welcome(joe.id).deliver!
    assert !ActionMailer::Base.deliveries.empty?

    log = MessageLog.last

    expected_attr = {
      'content_type'       => 'text/html; charset=UTF-8',
      'from'               => ['test@example.com'],
      'to'                 => ['joe@example.com'],
      'subject'            => 'Welcome Joe Foo',
      'perform_deliveries' => true,
      'charset'            => 'UTF-8'
    }

    assert_equal expected_attr, log.attributes.slice(*expected_attr.keys)
    assert_equal Notifier, log.delivery_handler
    assert log.errors.empty?
  end

end
