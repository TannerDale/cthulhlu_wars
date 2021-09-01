require 'rails_helper'

RSpec.describe 'GreatOldOne' do
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
    @kiy = GreatOldOne.create!({
      name: 'King in Yellow',
      faction_id: @fac1.id,
      cost: 4,
      awaken_steps: "Steps",
      combat: '0',
      ability: 'Steps'
    })
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
      faction_id: @fac2.id,
      cost: 10,
      awaken_steps: "Step",
      combat: 'Not Much',
      ability: 'Wow thats cool'
    })
    @tsat = GreatOldOne.create!({
      name: 'Tsathoggua',
      faction_id: @fac2.id,
      cost: 8,
      awaken_steps: "More\nsteps\nplease",
      combat: 'A lot',
      ability: 'Slow'
    })
  end

  it '#ordered' do
    expected = [@hast, @kiy, @nyar, @tsat]
    expect(GreatOldOne.ordered).to eq(expected)
  end

  it '#steps_to_awaken' do
    expected = ['More', 'steps', 'please']
    expect(@tsat.steps_to_awaken).to eq(expected)
  end
end
