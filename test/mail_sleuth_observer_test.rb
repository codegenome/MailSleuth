require 'test_helper'

class MailSleuthObserverTest < ActionMailer::TestCase

  fixtures :users

  def setup
    joe = users(:joe)
    Notifier.welcome(joe.id).deliver!
    @log = MessageLog.last
  end

  def teardown
    ActionMailer::Base.deliveries.clear
  end

  def test_sending_welcome_message
    assert !ActionMailer::Base.deliveries.empty?
  end

  def test_message_log_has_been_recorded
    expected_attr = {
      'content_type'       => 'text/html; charset=UTF-8',
      'from'               => ['test@example.com'],
      'to'                 => ['joe@example.com'],
      'subject'            => 'Welcome Joe Foo',
      'perform_deliveries' => true,
      'charset'            => 'UTF-8'
    }

    assert_equal expected_attr, @log.attributes.slice(*expected_attr.keys)
    assert_equal Notifier, @log.delivery_handler
    assert @log.errors.empty?
  end

  def test_message_log_errors_is_an_array
    assert_equal Array, @log.errors.class
  end

end
