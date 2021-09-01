require 'rails_helper'

RSpec.describe 'GreatOldOne index' do
  before :each do
  @fac1 = Faction.create!(
      name: 'Yellow Sign',
      color: 'Yelloq',
      description: 'Hello World!',
      unique_ability: 'Hello!',
      display_color: 'yelloew'
    )
      @hast = GreatOldOne.create!({
      name: 'Hastur',
      faction_id: @fac1.id,
      cost: 10,
      awaken_steps: "Steps",
      combat: 'Not A Lot',
      ability: 'Ability'
    })
    @nyar = GreatOldOne.create!({
      name: 'Nyarlathotep',
      faction_id: @fac1.id,
      cost: 10,
      awaken_steps: "Step",
      combat: 'Not Much',
      ability: 'Wow thats cool'
    })
    @tsat = GreatOldOne.create!({
      name: 'Tsathoggua',
      faction_id: @fac1.id,
      cost: 8,
      awaken_steps: "More\nsteps\nplease",
      combat: 'A lot',
      ability: 'Slow'
    })

    visit great_old_ones_path
  end

  it 'has all the names' do
    [@nyar, @tsat, @hast].each do |goo|
      expect(page).to have_content(goo.name)
    end
  end

  it 'has links to show pages' do
    click_on 'Hastur'

    expect(current_path).to eq(great_old_one_path(@hast.id))
  end
end
