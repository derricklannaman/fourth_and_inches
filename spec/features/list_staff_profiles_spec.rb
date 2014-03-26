require "spec_helper"

describe "Viewing the profile of team coaches" do

  it "shows the profiles" do
    visit 'http://example.com/staff'

    expect(page).to have_text('staff profiles')
  end

end