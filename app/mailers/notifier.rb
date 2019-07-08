class Notifier < ApplicationMailer
  def order_notification(admin_user)
    @email = admin_user.email
    mail to: @email, subject: 'Order Notification'
  end
end
