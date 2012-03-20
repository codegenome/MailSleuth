
class MailSleuth::Engine < ::Rails::Engine

  isolate_namespace MailSleuth

  initializer 'mail_sleuth.register_observer' do
    ActiveSupport.on_load :action_mailer do
      ActionMailer::Base.register_observer(MailSleuth::Observer)
    end
  end

end
