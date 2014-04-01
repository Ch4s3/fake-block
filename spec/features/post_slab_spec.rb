require "spec_helper"

feature "post a block to the home page" do
  
  describe "home page" do
    it "allows users to post blocks" do
      visit '/'
      fill_in "block[slab]", with: "super cool post!"
      click_button "Post"
      visit '/'

      expect(page).to have_content "super cool post!"
    end
  end
end