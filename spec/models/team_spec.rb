describe 'Team' do

  it 'is valid with a title, age_group, head_coach' do
    team = Team.new(
      title: 'Uniondale Knights',
      age_group: 10,
      head_coach: 100
      )
  end


end