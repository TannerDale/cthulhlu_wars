require 'rails_helper'

RSpec.describe 'factions index', type: :feature do
  before :each do
    @fac1 = Faction.create!(
      name: 'Yellow Sign',
      color: 'Yelloq',
      description: 'Hello World!',
      unique_ability: 'Hello!',
      display_color: 'yelloew'
    )
    @fac2 = Faction.create!(
      name: 'Cthulhu',
      color: 'Green',
      description: 'Hello World',
      unique_ability: 'Hello',
      display_color: 'green'
    )

    visit factions_path
  end

  it 'has faction names' do
    [@fac1, @fac2].each do |fac|
      expect(page).to have_content(fac.name)
    end
  end

  it 'has links to factions' do
    click_on @fac1.name

    expect(current_path).to eq("/factions/#{@fac1.id}")
  end

  it 'has factions ordered alphebetically' do
    expect(@fac2.name).to appear_before(@fac1.name, only_text: true)
  end
end
