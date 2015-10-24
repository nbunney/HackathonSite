class PollsController < ApplicationController
  before_action :authenticate_user!

  def show
    return unless current_user.admin?
    @scores = Poll.find(params[:id]).score
    render json: @scores
  end
end
