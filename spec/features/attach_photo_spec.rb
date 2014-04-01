require "spec_helper"

feature "post a block with a photo" do
  
  describe "block photo attachment" do
    it "allows users to post blocks with photos" do
      visit '/'
      fill_in "block[slab]", with: "super cool post!"
      click_button "add image"
      click_button "Post"
      visit '/'

      expect(page).to have_content "super cool post!"
      expect(page).to have_content "my cool photo"
    end
  end
end