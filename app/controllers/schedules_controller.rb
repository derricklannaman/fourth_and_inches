class SchedulesController < ApplicationController

  def schedule_manager
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @scheduled_event = Schedule.new
  end

end
