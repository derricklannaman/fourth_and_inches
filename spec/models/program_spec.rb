describe 'Program' do
  it "is valid with town_name, team_name, and league_name" do
    program = Program.new(
      town_name: 'Uniondale',
      team_name: 'Knights',
      league_name: 'NCYFL')
    expect(program).to be_valid
  end

  it "is invalid without a townname" do
    expect(Program.new(town_name: nil)).to have_validation_error(error=nil)
  end


  it "is invalid without a teamname"
  it "is invalid without a leaguename"
end