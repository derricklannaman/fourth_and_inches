require 'spec_helper'

describe OfficeController do

  describe "GET 'office_manager'" do
    it "returns http success" do
      get 'office_manager'
      response.should be_success
    end
  end

end
