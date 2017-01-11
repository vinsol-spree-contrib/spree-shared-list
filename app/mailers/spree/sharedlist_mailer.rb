class Spree::SharedlistMailer < ActionMailer::Base

  def share(object)
    @sharedlist = object.sharedlist
    @sender = @sharedlist.user
    @sender_name = object.sender_name
    @recipient_name = object.recipient_name
    sender_email = @sender.email
    recipient_mail = object.user.email

    opts = {}
    opts[:to] = recipient_mail
    opts[:subject] =  Spree.t(:subject, scope: :share_with_friend)
    opts[:from] = sender_email

    mail(opts)
  end
end

