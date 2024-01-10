# frozen_string_literal: true

class NotifywinnerMailer < ApplicationMailer
  default from: 'rizwan.ahmed.60499@gmail.com'
  SUBJECT = 'Bid Result'
  MSG = 'Congratulations you won the bid !! :'
  MSG2 = 'Sorry to inform you loose the bid !! :'

  def bid_winner(user)
    mail(
      to: user.email,
      body: "hellow #{user.name} #{MSG} ",
      content: 'text/html',
      subject: SUBJECT
    )
  end

  def bid_looser(user)
    mail(
      to: user.email,
      body: "hellow #{user.name} #{MSG2} ",
      content: 'text/html',
      subject: SUBJECT
    )
  end
end
