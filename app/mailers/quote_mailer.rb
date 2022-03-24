class QuoteMailer < ApplicationMailer
  def new_quote_email(email, thought)
    puts "inside QuoteMailer"
    @quote = "Luckily, Haddad and Gleason were already friends. Gleason gave him information, and Haddad was soon writing stories based on it. The Posť's stories had the effect on Gleason's city desk that he had known it would; his editors got interested in Title I [slum clearance] again-even more so because Gleason was able to provide them with new leads, given him by Haddad. For Haddad quickly arrived at the same realization as Cook and Gleason. 'We found out very early that it had to be a joint effort,' he says. 'It would never go. It would rise and die in one paper, unless another paper picked it up. Then the TV would pick it up and then the political authorities would start to react. That was the carbohydrate that made it work.'"
    puts "about to send an email..."
    
    @thought_image = "https://giphy.com/gifs/foofighters-foo-fighters-studio-666-GWAj8i8uvwMryjq5Lx"
    
    
    mail(
      to: email, 
      subject: "You got a new order!", 
      body: @quote + "\n\n" + thought + image_tag(@thought_image)
    )
  end
end
