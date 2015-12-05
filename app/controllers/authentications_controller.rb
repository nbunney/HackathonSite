class AuthenticationsController < ApplicationController
  # GET /authentications/:provider/callback
  def create
    if user_signed_in?
      # Add to existing account
      Authentication.create!(
        service: auth[:provider],
        uid: auth[:uid],
        user: current_user
      )
      redirect_to '/', notice: "An account at #{auth[:provider]} has been linked to your account"
    elsif authentication = find_auth
      sign_in! authentication.user
    else
      session['prefill_signup'] = signup_info
      redirect_to new_user_registration_path
    end
  end

  private
  def find_auth
    @auth ||= Authentication.where(service: auth[:provider], uid: auth[:uid]).first
  end

  def auth
    @omniauth ||= request.env['omniauth.auth']
  end

  def signup_info
    {
      auth: {
        service: auth[:provider],
        uid: auth[:uid]
      },
      user: {
        name: auth[:info][:name],
        email: auth[:info][:email],
        image: auth[:info][:image]
      }
    }
  end
end
