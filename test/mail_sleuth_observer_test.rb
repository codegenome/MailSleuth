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
  end

end
