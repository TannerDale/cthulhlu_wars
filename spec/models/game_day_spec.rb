require 'rails_helper'

RSpec.describe 'GameDay', type: :model do
  before :each do
    User.destroy_all
    GameDay.destroy_all
    CanAttend.destroy_all

    @user1 = User.create!(
      username: rand(10000).to_s,
      password: 'pw',
      password_confirmation: 'pw'
    )
    @user2 = User.create!(
      username: rand(10000).to_s,
      password: 'pw',
      password_confirmation: 'pw'
    )
    @day = GameDay.create!(
      day: DateTime.new(2021, 12, 27)
    )
    @day2 = GameDay.create!(
      day: DateTime.new(2021, 10, 31)
    )

    CanAttend.create!(
      game_day_id: @day.id,
      user_id: @user1.id
    )
  end

  it '#format_names' do
    expect(@day.format_names(@day.users)).to eq(@user1.username)
  end

  it '#can_attend' do
    expect(@day.can_attend).to eq(@user1.username)
  end

  it '#cannot_attend' do
    expect(@day.cannot_attend.include?(@user1.username)).to be(false)
  end

  it 'can format a date' do
    expect(@day.formatted).to eq('Dec 27 at 12:00AM')
  end

  it '#days' do
    expect(GameDay.days).to eq([@day2, @day])
  end
end
