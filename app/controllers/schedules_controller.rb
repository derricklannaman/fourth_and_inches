class SchedulesController < ApplicationController

  def schedule_manager
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @team_id = current_user.teams
    @event_types = ['practice',  'game', 'other' ]
    # binding.pry
  end

  def new
    @scheduled_event = Schedule.new
    # @event_types = ['practice',  'game', 'other' ]
    # binding.pry
  end

  def create
    @cal_event = Schedule.new()
    @cal_event.team_id = params[:entry][:id]
    @cal_event.type = params[:entry][:entry_type]
    # calendar_event.type = params[:entry][:date]
    # calendar_event.type = params[:entry][:time]
    @cal_event.save

    render json: { event: @cal_event}
  end

end
