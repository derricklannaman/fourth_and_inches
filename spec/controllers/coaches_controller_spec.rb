require 'spec_helper'

describe CoachesController do

  describe "GET 'coaches_corner'" do
    it "returns http success" do
      get 'coaches_corner'
      response.should be_success
    end
  end

end
