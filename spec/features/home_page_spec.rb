feature "Home Page" do

  scenario 'Visiting the Home Page' do
    visit '/'
    expect(page).to have_content '4th and inches'
  end


end
