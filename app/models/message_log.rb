require 'mail/fields/common/common_address'

class MessageLog < ActiveRecord::Base

  ERROR_REPORTS_ATTR = %w(message_id bounced? final_recipient action
                          error_status diagnostic_code retryable?)

  SERIALIZED_ATTR = %w(from to delivery_method delivery_handler errors)

  OTHER_ATTR = %w(subject content_type charset perform_deliveries)

  ALL_ATTR = ERROR_REPORTS_ATTR + SERIALIZED_ATTR + OTHER_ATTR

  SERIALIZED_ATTR.each do |attr|
    serialize attr
  end

  # TODO: Find out why it can't get serialized.
  def delivery_handler
    attributes['delivery_handler'].constantize
  end

  class << self
    # HACK: ignoring AR errors method
    def instance_method_already_implemented?(method_name)
      return true if method_name == 'errors'
      super
    end
  end

end
