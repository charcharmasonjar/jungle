require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They view product detail page" do
    # ACT
    visit root_path

    #click on details button on first product
    within first('article.product') do
      # click_link 'Details »'
      find(:css, ".btn.btn-default.pull-right").click
    end

    # WAIT FOR PAGE TO LOAD
    sleep 5

    # VERIFY
    expect(page).to have_css 'article.product-detail'
    
    # DEBUG 
    save_screenshot
  end

end