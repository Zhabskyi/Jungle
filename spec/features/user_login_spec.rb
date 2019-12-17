require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
   # SETUP
   before :each do
    @user = User.create!(
      first_name: "John", 
      last_name: "Doe", 
      email: "doe@gmail.com", 
      password: "123456", 
      password_confirmation: "123456"
    )

    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product datail" do
    # ACT
    visit '/sessions/new'
    
    within('form') do
      fill_in 'Email', with: 'doe@gmail.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Submit'

    
    # VERIFY
     expect(page).to have_content(@user.first_name), count: 1
     expect(page).to have_content(@user.last_name), count: 1
     expect(page).to have_current_path(root_path)

    save_screenshot
  end
end
