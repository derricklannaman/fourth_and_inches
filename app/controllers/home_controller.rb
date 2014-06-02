class HomeController < ApplicationController

  def index
    if user_signed_in?
      if (current_user.program.blank?) && (current_user.has_role?("director"))
        redirect_to(controller: "programs", action: "new")
      elsif current_user.has_role?("parent_user")
        website = current_user.program.websites.first.id
        @website = Website.friendly.find(website)
        redirect_to @website
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
