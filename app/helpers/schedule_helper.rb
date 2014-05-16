module ScheduleHelper

  def show_time(time)
    time = time.to_time
    time.utc.strftime('%l:%M')
  end

  def show_opponent(event)
    if event.entry_type == "Game"
      o = Opponent.find(event.opponent_id).name
      "vs #{o}"
    else
      return
    end
  end


end
