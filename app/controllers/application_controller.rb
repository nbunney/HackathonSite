class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :xhr?

  before_action :include_pertinent_events, :enable_mini_profiler

  def not_found!
    raise ActionController::RoutingError.new('Not Found')
  end 

  protected

  def xhr?
    request.xhr?
  end

  def enable_mini_profiler
    if current_user && current_user.admin?
      unless Rails.env.production?
        Rack::MiniProfiler.authorize_request
      end
    end
  end

  def include_pertinent_events
    @future_events = Event.after.by_date.limit(4)
    @past_events = Event.before.by_date.limit(4)
    @next_event = @future_events.first
    @prev_event = @past_events.last

    # If we don't have a future event, show two past events
    unless @next_event
      @next_event = @prev_event
      @prev_event = @past_events.last(2).first
    end

    # An event in the past 2 days is still recent enough to consider "primary"
    prev_date = @prev_event.try(:date) || Date.new(2010, 1, 1)
    is_recent = Date.today - prev_date > 2.days
    @primary_event = is_recent ? @prev_event : @next_event

  end
end
