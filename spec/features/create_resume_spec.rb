# feature 'User creates a Resume' do
#   scenario 'they see the Resume on the page' do
#     visit new_Resume_path
#
#     #TODO: Use Factory Girl here?
#     fill_in 'First Name', with: 'Omniscient'
#     fill_in 'Last Name', with: 'Bob'
#     fill_in 'Email 1', with: 'bob@omniscient.com'
#     fill_in 'Phone 1', with: '404-404-4040'
#     fill_in 'Address', with: '123 ABC Lane'
#     fill_in 'Postal Code', with: '30000'
#     fill_in 'City', with: 'Atlanta'
#     select 'MA', from: 'State'
#
#
#     click_button 'Create Resume'
#
#     expect(page).to have_css '.Resume-name', 'Omniscient'
#     expect(page).to have_css '.Resume-last-name', 'Bob'
#     expect(page).to have_css '.email-1', 'bob@omniscient.com'
#     expect(page).to have_css '.phone-1', '404-404-4040'
#     expect(page).to have_css '.address', '123 ABC Lane'
#     expect(page).to have_css '.postal-code', '30000'
#     expect(page).to have_css '.city', 'Atlanta'
#     expect(page).to have_css '.state', 'GA'
#   end
# end
