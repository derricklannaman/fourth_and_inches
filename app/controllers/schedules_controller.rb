class SchedulesController < ApplicationController

  def schedule_manager
    @opponents = current_user.program.opponents
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
    set_calendar_event_attrs(@cal_event)
    @cal_event.save
    render json: { event: @cal_event}
  end

  def show
    @event = Schedule.find(params[:id])
    @opponent = Opponent.find_by id: @event.opponent_id
    if @opponent.nil?
      return
    else
      @hash = Gmaps4rails.build_markers(@opponent) do |opponent, marker|
        marker.lat opponent.latitude
        marker.lng opponent.longitude
        marker.infowindow "#{opponent.name} #{opponent.address}"
      end
    end
  end


  private

    def set_calendar_event_type(cal_event, num)
      @cal_event = cal_event
      if num == '1'
        @cal_event.entry_type = 'Practice'
      elsif num == '2'
        @cal_event.entry_type = 'Game'
        @cal_event.opponent_id = Opponent.find(params[:entry][:vs]).id #add only if Game selected
      elsif num == '3'
        @cal_event.entry_type = 'Other'
      end
    end

    def set_calendar_event_attrs(cal_event)
      @cal_event = cal_event
      @cal_event.team_id = params[:entry][:id]
      @cal_event.date = params[:entry][:date]
      @cal_event.time = params[:entry][:time]
    end

end
