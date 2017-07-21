feature 'Lose game page' do
  scenario 'Expect to see a lose message after reaching 0 HP' do
    sign_in_and_play
    12.times { click_button "Attack" }
    expect(page).to have_content "Ha-ha! John, you lose!"
  end
end
