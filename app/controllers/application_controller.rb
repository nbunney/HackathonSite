class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :include_pertinent_events

  protected

  def include_pertinent_events
    @next_event = Event.after.by_date.first
    @prev_event = Event.before.by_date.last
    # An event in the past 2 days is still recent enough to consider "primary"
    prev_date = @prev_event.try(:date) || Date.new(2010, 1, 1)
    is_recent = Date.today - prev_date > 2.days
    @primary_event = is_recent ? @prev_event : @next_event
  end
end
