class SendGifToUserJob
  include Sidekiq::Job

  def perform(*args)
    logger.debug "inside SendGifToUserJob"
    logger.debug "now inside #{self.class} perform"
    logger.debug args
    email = args[0]
    thought = args[1]
    
    QuoteMailer.new_quote_email(email, thought).deliver_now

  end
end
