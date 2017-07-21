feature 'the player hit points' do
  scenario 'Expect to see player 1 hit points' do
    sign_in_and_play
    expect(page).to have_content("Bob: 60HP")
  end

  scenario 'Expect to see player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content("John: 60HP")
  end

end
