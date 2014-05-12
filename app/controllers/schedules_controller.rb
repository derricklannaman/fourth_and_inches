class SchedulesController < ApplicationController

  def schedule_manager
    @appointments = current_user.teams.active.schedules
    @appointments_by_date = @appointments.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @team_id = current_user.teams
  end

  def new
    @scheduled_event = Schedule.new
  end

  def create
    @cal_event = Schedule.new()
    num = params[:entry][:event_type]

    set_calendar_event_type(@cal_event, num)

    @cal_event.team_id = params[:entry][:id]
    @cal_event.date = params[:entry][:date]
    @cal_event.time = params[:entry][:time]
    @cal_event.save
    render json: { event: @cal_event}
  end


  private

    def set_calendar_event_type(cal_event, num)
      @cal_event = cal_event
      if num == '1'
        @cal_event.entry_type = 'practice'
      elsif num == '2'
        @cal_event.entry_type = 'game'
      elsif num == '3'
        @cal_event.entry_type = 'other'
      end
    end

end
