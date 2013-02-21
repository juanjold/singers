require 'spec_helper'

describe 'Adding a new singer' do
  it 'requires a last name', js: true do
    visit singers_path
    click_link "New Singer"
    fill_in "Name", with: "Jolay"
    click_button "Submit"
    
    error_message = "Lastname can't be blank"
    page.should have_content error_message
  end
  
  it 'requires a name', js: true do
    visit singers_path
    click_link "New Singer"
    fill_in "Lastname", with: "Koo"
    click_button "Submit"
    
    error_message = "Name can't be blank"
    page.should have_content error_message
  end
  
   
  it 'requires valid email', js: true do
    visit singers_path
    click_link "New Singer"
    fill_in "Lastname", with: "Koo"
    fill_in "Number", with: "1232321232"
    fill_in "Email", with: "poop"
    click_button "Submit"
    
    error_message = "Email is invalid"
    page.should have_content error_message
  end

  it 'requires a number', js: true do
    visit singers_path
    click_link "New Singer"
    fill_in "Name", with: "Jorge"
    fill_in "Lastname", with: "Koo"
    fill_in "Email", with: "jorgejolay@koo.com"
    click_button "Submit"
    
    error_message = "Number is the wrong length"
    page.should have_content error_message
  end
  
  it 'requires a number', js: true do
    visit singers_path
    click_link "New Singer"
    fill_in "Name", with: "Jorge"
    fill_in "Lastname", with: "Koo"
    fill_in "Number", with: "jorgejolay@koo.com"
    fill_in "Email", with: "plop@gmail.com"
    click_button "Submit"
    
    error_message = "Number is not a number"
    page.should have_content error_message
  end
  
end
