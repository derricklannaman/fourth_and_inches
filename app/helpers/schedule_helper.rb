module ScheduleHelper

  def show_time(time)
    if time.blank?
      time = 'Regular Time'
    else
      time = time.to_time
      time.utc.strftime('%l:%M')
    end
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
