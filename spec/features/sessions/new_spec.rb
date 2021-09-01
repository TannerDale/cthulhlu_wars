require 'rails_helper'

RSpec.describe 'Sessions new' do
  it 'can log in a user' do
    user = User.create!(
      username: 'Chuck',
      password: 'test',
      password_confirmation: 'test'
    )

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(current_path).to eq(root_path)
    expect(page).to have_content(user.username)
  end

  it 'can alert if no user found' do
    visit login_path

    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Sorry, no matching account.')
  end

  it 'will only show admin dashboard to admins / can logout' do
    user = User.create!(
      username: 'Chuck',
      password: 'test',
      password_confirmation: 'test'
    )

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(page).not_to have_content('Admin Dashboard')

    click_on 'Logout'

    admin = User.create!(
      username: 'Admin',
      password: 'test',
      password_confirmation: 'test',
      role: 1
    )

    visit login_path

    fill_in 'Username', with: admin.username
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(page).to have_content('Admin Dashboard')
  end
end
