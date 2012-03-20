
class Notifier < ActionMailer::Base

  default :from => "test@example.com"

  def welcome(user_id)
    @user = User.find(user_id)

    mail(:to      => @user.email,
         :subject => "Welcome #{@user.name}")
  end

end
