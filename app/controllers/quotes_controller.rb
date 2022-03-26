class QuotesController < ApplicationController
  def create
    logger.debug "about to call worker from QuotesController"
    # SendGifToUserWorker.new.perform(params[:mailers][:email], params[:mailers][:thought])
    
    SendGifToUserJob.perform_async(params["quote_mailer"]["email"], params["quote_mailer"]["thought"])
    flash[:message] = "You did it! Email sent to #{params["quote_mailer"]["email"]}"
    redirect_to "/sent"  
  end

  def sent
  end
end
