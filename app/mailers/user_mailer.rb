class UserMailer < ApplicationMailer
  default from: "amyrhunter@gmail.com"

  def welcome_email(user)
   @user = user
   @url  = 'https://www.roomiepayup.com'

   mail(to: @user.email,
         subject: "You have been added as a housemate for your household on RoomiePayUp.com",
         )
  end

  def new_share_email(share)
    @share = share
    @url = 'https://www.roomiepayup.com'
    @share_amount = share.share_amount
    @share_due_date = share.due_date
    @bill = Bill.find(@share.bill_id)
    @bill_name = @bill.name
    @user = User.find(share.user_id)
    @household = Household.find(@user.household_id)

    mail(to: @user.email,
          subject: "You have been assigned a share of a bill on RoomiePayUp.com",
          )
  end
end
