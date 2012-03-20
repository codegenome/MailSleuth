
class CreateMessageLogs < ActiveRecord::Migration

  def self.up
    create_table :message_logs do |t|
      text_attr = %w(to errors)
      bool_attr = %w(perform_deliveries bounced? retryable?)
      str_attr  = MessageLog::ALL_ATTR - text_attr - bool_attr

      text_attr.each { |c| t.text c }
      bool_attr.each { |c| t.boolean c.sub('?', '') }
      str_attr.each  { |c| t.string c }

      t.datetime :created_at
    end
  end

  def self.down
    drop_table :message_logs
  end

end
