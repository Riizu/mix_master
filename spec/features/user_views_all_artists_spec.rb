require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario "They see the page for all the artists" do
    artist_name_1 = "Bob Marley"
    artist_name_2 = "Smash Mouth"
    image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    Artist.create(name: artist_name_1, image_path: image_path)
    Artist.create(name: artist_name_2, image_path: image_path)

    visit artists_path

    expect(page).to have_selector(:link_or_button, artist_name_1)
    expect(page).to have_selector(:link_or_button, artist_name_2)

    click_on artist_name_1

    expect(page).to have_content artist_name_1
  end
end
