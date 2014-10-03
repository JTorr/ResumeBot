feature 'User creates a CV' do
  scenario 'they see the CV on the page' do
    visit new_CV_path

    #TODO: Use Factory Girl here?
    fill_in 'First Name', with: 'Omniscient'
    fill_in 'Last Name', with: 'Bob'
    fill_in 'Email 1', with: 'bob@omniscient.com'
    fill_in 'Phone 1', with: '404-404-4040'
    fill_in 'Address', with: '123 ABC Lane'
    fill_in 'Postal Code', with: '30000'
    fill_in 'City', with: 'Atlanta'
    #FIXME: change state to drop-down selector
    fill_in 'State', with: 'GA'

    click_button 'Create CV'

    expect(page).to have_css '.cv-name', 'Omniscient'
    expect(page).to have_css '.cv-last-name', 'Bob'
    expect(page).to have_css '.email-1', 'bob@omniscient.com'
    expect(page).to have_css '.phone-1', '404-404-4040'
    expect(page).to have_css '.address', '123 ABC Lane'
    expect(page).to have_css '.postal-code', '30000'
    expect(page).to have_css '.city', 'Atlanta'
    expect(page).to have_css '.state', 'GA'
  end
end
