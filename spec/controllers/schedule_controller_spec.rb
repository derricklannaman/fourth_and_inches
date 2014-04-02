require 'spec_helper'

describe ScheduleController do

  describe "GET 'schedule_manager'" do
    it "returns http success" do
      get 'schedule_manager'
      response.should be_success
    end
  end

end
