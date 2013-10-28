require 'spec_helper'

describe "Articles" do

  context "#index" do

    it 'should display articles' do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Article.create(:title => 'Today News', :body => 'This news is brought to you by India News Today')
      #get articles_path
      #response.status.should be(200)
      #response.body.should include('Create Article')
      visit articles_path
      page.should have_content('Today News')
    end


    it 'should go to create article page' do
      visit articles_path
      click_link('Create Article')
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Body'
    end


  end


  context '#new' do

    it 'should create article' do
      visit new_article_path
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Body'
      fill_in 'article_title', :with => 'My Day At Trantor'
      fill_in 'article_body',  :with => 'The day at trantor was awesome'
      click_button 'Save'
      expect(page).to have_content 'My Day At Trantor'
    end


    it 'should show validation errors' do
      visit new_article_path
      fill_in 'article_title', :with => ''
      fill_in 'article_body',  :with => ''
      click_button 'Save'
      expect(page).to have_content "can't be blank"
    end
  end

end
