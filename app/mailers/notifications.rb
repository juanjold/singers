class Notifications < ActionMailer::Base
  default from: "pennsingerssecretary@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_singer.subject
  #
  def new_singer(singer)
    @singer = singer
    @greeting = "Hi! Thank you for signing up, #{singer.name}!"

    mail to: singer.email
  end
  
  def update_singer(singer)
    @singer = singer
    @greeting = "Hey #{singer.name}, your user was recently edited, if this wasn't you please contact the Secretary."

    mail to: singer.email
  end
end
