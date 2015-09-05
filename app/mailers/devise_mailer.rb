class DeviseMailer < Devise::Mailer
  helper :application
  helper :mail

  include Roadie::Rails::Automatic
  include Devise::Controllers::UrlHelpers

  default template_path: 'devise/mailer'
end
