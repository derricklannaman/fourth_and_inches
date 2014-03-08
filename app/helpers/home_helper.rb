module HomeHelper

  def show_time
    @time = Time.now
    content_tag(:strong, "Time : #{@time}")
  end

end
