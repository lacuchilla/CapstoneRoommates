class UserMailer < ApplicationMailer
  default from: "amyrhunter@gmail.com"

  def welcome_email(user)
   @user = user
   @url  = 'https://www.roomiepayup.com'

   mail(to: @user.email,
         subject: "You have been added as a housemate for your household on RoomiePayUp.com",
         )
  end

end
