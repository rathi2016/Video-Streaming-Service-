# ALGORITHM
# Write a function that, given a list of invoices and subscribers, would find subscribers
# who haven’t paid their invoices and need to be sent a cancellation notice.
# You can use pseudo code or any programming language of your choice to write this!

# ASSUMTION MADE:
# assuming that we have models for  invoices and subscribers/users
# List of invoices and subscribers/users params is coming from database.
# A single invoice may look like this {invoice_id: 101, user_id: 1, amount_due: 0, hrs_video_viewed: 35, subscription_status: "past due"}
# A single subscriber may look like this {user_id: 1, firstname: "John", lastname: "Snow", email: "john.snow@example.com", subscription_tier: 2, creditcardnbr:*******345, street: "111", city: "NYC", zip: "11520", phone: "9135356089" }
# code is in Ruby.


class Notification

  def initialize(invoices,subscribers)
    @invoices = invoices
    @subscribers = subscribers
    cancellation_notification
  end
# the below method updates the subscription_status with current value based on billing cycle
# and send notification message to user.
  def cancellation_notification
    @invoices.each do |invoice|
      if (invoice[:subscription_status] == "past due" && invoice[:amount_due] > 0 && invoice[:hrs_video_viewed] > 2
        cancellation_msg(:user_id))
        invoice[:subscription_status] = "canceled"
      end
    end
  end

  def cancellation_msg(user_id)
      @subscribers.find([:user_id])
      puts "You have been deactivated !"
  end

end
invoices = [{invoice_id: 101, user_id: 1, amount_due: 0, hrs_video_viewed: 35, subscription_status: "past due"}]
subscribers = [{user_id: 1, firstname: "John", lastname: "Snow", email: "john.snow@example.com", subscription_tier: 2, creditcardnbr:"123456345", street: "111", city: "NYC", zip: "11520", phone: "9135356089" }]
testing = Notification.new(invoices, subscribers)
