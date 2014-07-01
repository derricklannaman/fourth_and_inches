feature "Home Page - " do

  scenario 'When visiting the Home Page' do
    visit '/'
    expect(page).to have_content '4th and inches'
    expect(page).to have_link 'Home'
    expect(page).to have_link 'About'
    expect(page).to have_link 'FAQ'
    expect(page).to have_link 'Contact Us'
  end


end
