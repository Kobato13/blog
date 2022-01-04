require 'rails_helper'

RSpec.describe "Articles", type: :feature do

  describe 'View all articles' do
    before {visit articles_path}

    it 'shows all articles in the body' do
      within 'body' do
        expect(page).to have_content('This is coming from articles#index')
        expect(page).to have_content('Hello, World')

      end
    end
  end

  describe 'View the new article form' do
    before {visit new_article_path}

    it 'shows form in the body' do
      within 'body' do
        expect(page).to have_content('Create an Article')

      end
    end

    it 'Successfully create a new article' do
      # fill_in 'article_title', with: 'test title'
      fill_in "Title", with: "New Title"
      fill_in "Author", with: "New Author"
      fill_in "Content", with: "Test Content"
      click_on('Create Article')
      expect(page).to have_current_path(articles_path)
      expect(page).to have_content('An article was successfully created')

    end
  end

end