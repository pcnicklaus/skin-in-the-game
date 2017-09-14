class ChallengeMailer < ApplicationMailer

  default from: 'skininthegame@gmail.com'

  def challenge_email(challenge)
    @challenge = challenge
    @user = challenge.user
    # build query string
    # @url
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')

  end

end
