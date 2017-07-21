feature 'Attacking' do
  scenario 'Notify which player has been attacked' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("Bob attacked John!!!")
    click_button "Attack"
    expect(page).to have_content("John attacked Bob!!!")
  end

  scenario "reduce the player's points" do
    sign_in_and_play
    srand(4)
    click_button "Attack"
    expect(page).to have_content("49HP")
  end
end
