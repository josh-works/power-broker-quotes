class QuoteMailer < ApplicationMailer
  def new_quote_email
    @quote = TodaysRobertMosesQuote.index

    mail(to: 'foo@bar.com', subject: "You got a new order!")
  end
end
