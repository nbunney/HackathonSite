class DeviseMailer < Devise::Mailer
  helper :application
  helper :mail

  include Roadie::Rails::Automatic
  include Devise::Controllers::UrlHelpers

  default template_path: 'devise/mailer'

  def roadie_options
    opts = super.merge({
      url_options: Rails.application.config.action_mailer.default_url_options
    })
    p opts
    opts
  end
end
