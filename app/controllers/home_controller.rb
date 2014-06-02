class HomeController < ApplicationController

  def index
    if user_signed_in? && ((current_user.program.blank?) && (current_user.has_role?("director")))
      redirect_to(controller: "programs", action: "new")
    elsif user_signed_in? && current_user.user_type == "parent_user"
      binding.pry
      website = current_user.program.website.first.id
      redirect_to website_path(website)
    else
      redirect_to(controller: "dashboard", action: "show")
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
