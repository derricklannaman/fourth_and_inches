class HomeController < ApplicationController

def index
  if user_signed_in?
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
