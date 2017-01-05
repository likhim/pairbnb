class ReminderJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, reservation_id)
    ReminderMailer.reminder_email(customer, host, reservation_id).deliver_later(wait: 5.minutes)
  end
end
