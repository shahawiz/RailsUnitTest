require 'rails_helper'

RSpec.feature "Posts::Update", type: :feature do
  scenario 'all data are valid' do
    post = Post.create(id:1,title:"Hello Edit",content:"sdfsdf")
    visit edit_post_path(post)
    within("#edit_post_#{post.id}") do
      fill_in 'post_title', with: 'Unit Testing'
      fill_in 'post[content]', with: 'Testing edit example'
      sleep 2
      click_button(id: 'btn-submit')
      
    end
    post = Post.find_by(title: 'Unit Testing')

    page.has_selector?("#phost-#{post.id}")

    expect(page).to have_selector("#post-#{post.id}")

    sleep 2
  end
end
