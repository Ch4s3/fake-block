require "spec_helper"

feature "Post Comment" do
  scenario "User creates new comment on post" do

    email = "emusk@spacex.com"
    password = "12345678"
    User.create(email: email, password: password)

    Block.create(body: "new block", user_id: User.last.id)
    binding.pry
    visit '/'
    binding.pry
    click_link 'log in'

     fill_in "Email", with: email
     fill_in "Password", with: password
     click_button "Log in"

    binding.pry
    fill_in "Comment", with: "Test Comment"
    click_button  "comment"
    visit  '/'

    expect(page).to have_content "Test Comment"
  end
end
