class Users::RegistrationsController < Devise::RegistrationsController
  before_action :allow_params, only: [:create, :update]
  layout 'form'

  def new
    @event = params.delete(:event)
    @auth = session['prefill_signup']['auth'] if session['prefill_signup']
    super
    session.delete('prefill_signup')
  end

  def create
    event = params.delete(:event)
    super do |user|
      if user.persisted?
        if event
          @participant = Participant.new(user: user, event: event)
          authorize @participant
          @participant.save!
        end
      end
    end
  end

  protected

  def after_sign_up_path_for(_)
    '/'
  end

  def allow_params
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
