class Users::RegistrationsController < Devise::RegistrationsController
  before_action :allow_params, only: [:create, :update]
  layout 'form'

  def new
    @event = params.delete(:event)
    super
  end

  def create
    event = params.delete(:event)
    super do |user|
      if event && user.persisted?
        @participant = Participant.new(user: user, event: event)
        authorize @participant
        @participant.save!
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
