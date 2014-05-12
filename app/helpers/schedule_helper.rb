module ScheduleHelper

  def show_time(time)
    time = time.to_time
    time.utc.strftime('%l:%M')
  end


end
