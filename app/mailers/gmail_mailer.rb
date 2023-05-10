class GmailMailer < ApplicationMailer
    default from: "myrubytest99@gmail.com"
    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subject: "huray!,your chatroom with seller created" )
    end
end
