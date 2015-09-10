class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :include_pertinent_events, :enable_mini_profiler

  protected

  def enable_mini_profiler
    if current_user && current_user.admin?
      Rack::MiniProfiler.authorize_request
    end
  end

  def include_pertinent_events
    @future_events = Event.after.by_date.limit(4)
    @past_events = Event.before.by_date.limit(4)
    @next_event = @future_events.first
    @prev_event = @past_events.last

    # An event in the past 2 days is still recent enough to consider "primary"
    prev_date = @prev_event.try(:date) || Date.new(2010, 1, 1)
    is_recent = Date.today - prev_date > 2.days
    @primary_event = is_recent ? @prev_event : @next_event
  end
end
