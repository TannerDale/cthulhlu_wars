require 'rails_helper'

RSpec.describe 'GreatOldOne show', type: :feature do
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

    visit great_old_one_path(@hast.id)
  end

  it 'has GOO info' do
    expect(page).to have_content(@hast.name)
    expect(page).to have_content(@hast.combat)
    expect(page).to have_content(@hast.ability)

    @hast.steps_to_awaken.each do |step|
      expect(page).to have_content(step)
    end
  end

  it 'has a link to its faction' do
    click_on @fac1.name

    expect(current_path).to eq(faction_path(@fac1.id))
  end
end
