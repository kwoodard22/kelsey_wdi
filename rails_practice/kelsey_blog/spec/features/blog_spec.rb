require 'rails_helper'

feature "Manage Posts" do  # 'manage' is the CRUD
  def create_post
    Post.create!(                    # GIVEN
       subject: 'Dogs',
       body: 'Are the best.',
       published: '2014-10-20',
       draft_status: false
    )
  end

  scenario "List no Posts" do
    visit posts_path
    expect(page.find('.header')).to have_content(/Kelsey's Blog/)
    expect(page).to have_content("No posts have been written")
  end

  scenario "List all Posts" do
    post = create_post
    visit posts_path(post)               # WHEN
    expect(page.find('.post')).to have_content(/Dogs/)    # THEN
    expect(page).to have_no_content("No posts available")
    # we are looking for classes so we have (.) instead of # for id. In our css we can then find them via our class names in the CSS.
  end

  scenario "Redirect to New Post Form" do
    visit posts_path

    click_on 'ADD NEW POST' 
    expect(current_path).to eq(new_post_path)
  end

  scenario "Add new Post" do
    post = create_post
    visit new_post_path(post)
    fill_in 'Subject', with: 'Dogs'
    fill_in 'Body', with: 'Are the best.'
    select '2014', from: 'post[published(1i)]'
    select 'October', from: 'post[published(2i)]'
    click_on 'Create Post'

  expect(current_path).to eq(post_path(Post.last.id))
  # expect(find('.notice')).to have_content(/success/i)

  end

  scenario "Edit an Album & be redirected to see new post" do
    post = create_post
    visit edit_post_path(post)

    fill_in 'Subject', with: 'Cats'
    fill_in 'Body', with: 'Are the best.'
    select '2014', from: 'post[published(1i)]'
    select 'October', from: 'post[published(2i)]'
    select '31', from: 'post[published(3i)]'
    click_on 'Update Post'

    expect(current_path).to eq(post_path(post))       #when we edit the page it takes right back to show page of the album

  end

  scenario "Delete a post & redirect to index page" do
    post = create_post

    visit post_path(post)
    click_on 'Destroy'

    expect(current_path).to eq(posts_path)
    expect(posts_path).to_not have_content("Dogs")
  end

end
