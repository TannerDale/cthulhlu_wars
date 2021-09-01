require 'rails_helper'

RSpec.describe 'factions show', type: :feature do
  before :each do
    @fac = Faction.create!(
      name: 'Yellow Sign',
      color: 'Yelloq',
      description: 'Hello World!',
      unique_ability: 'Hello!',
      display_color: 'yelloew'
    )
    @kiy = GreatOldOne.create!({
      name: 'King in Yellow',
      faction_id: @fac.id,
      cost: 4,
      awaken_steps: "1) You must have a Unit in an Area lacking a Gate.\n2) Pay 4 Power. The King appears in that Area.",
      combat: '0',
      ability: 'Desecrate (Action: Cost 2): If the King is in an Area with no Desecration token, roll 1 die. If the roll is equal to or less than the number of your Units in the Area (including the King), place a Desecration token in the Area. Whether you succeed or fail, place a Monster or Cultist with a cost of 2 or less in the Area.'
    })
    @sb1 = Spellbook.create!({
      faction_id: @fac.id,
      name: 'He Who is Not to be Named',
      use: '1',
      description: 'Move Hastur to any Area containing a Cultist of any Faction. You may then take a second, different Action. You may NOT take The Screaming Dead as your second Action.'
    })
    @sb2 = Spellbook.create!({
      faction_id: @fac.id,
      name: 'Passion',
      use: 'Ongoing',
      description: 'When one or more of your Cultists are Eliminated by an enemy (Killed, Captured, etc.), gain 1 Power.'
    })
     visit faction_path(@fac.id)
  end

  it 'has faction info' do
    expect(page).to have_content(@fac.name)
    expect(page).to have_content(@fac.color)
    expect(page).to have_content(@fac.unique_ability)
    expect(page).to have_content(@fac.great_old_ones.first.name)

    [@sb1, @sb2].each do |sb|
      expect(page).to have_content(sb.name)
      expect(page).to have_content(sb.use)
      expect(page).to have_content(sb.description)
    end
  end
end
