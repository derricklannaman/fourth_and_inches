class HomeController < ApplicationController

  def index
    if user_signed_in?
      binding.pry
      if (current_user.program.blank?) && (current_user.has_role?("director"))
        redirect_to(controller: "programs", action: "new")
      else
        redirect_to(controller: "dashboard", action: "show")
      end
    end
  end

  def about
  end

  def faq
  end

  def contact
  end

  def features
  end

  def video_help
  end


end
