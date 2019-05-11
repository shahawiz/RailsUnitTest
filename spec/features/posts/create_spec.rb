require 'rails_helper'

RSpec.feature "Posts::Creates", type: :feature do
  scenario 'all data are valid' do
    visit new_post_path
    within("#new_post") do
      fill_in 'post_title', with: 'Unit Testing'
      fill_in 'post[content]', with: 'Testing is important to catch bugs'
      sleep 2
      click_button(id: 'btn-submit')
      
    end
    post = Post.find_by(title: 'Unit Testing')

    page.has_selector?("#post-#{post.id}")

    sleep 2
  end
end
