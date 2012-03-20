
class MailSleuth::Observer

  def self.delivered_email(message)
    log = MessageLog.new

    (MessageLog::ALL_ATTR - ['delivery_handler']) \
      .each do |attr|
      if message.respond_to? attr
        log_attr = attr.sub('?', '')
        log.send "#{log_attr}=", message.send(attr)
      else
        STDERR.puts "WARNING - MailSleuth missing attribute: #{attr}"
      end
    end

    # TODO: Find out why it can't get serialized.
    log.delivery_handler = message.delivery_handler.to_s if message.respond_to? :delivery_handler

    log.save!
  end

end
