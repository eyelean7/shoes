Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('shoes', {:type => :feature}) do
  it "allows users to add brands" do
    visit('/')
    click_link('Add Brand')
    fill_in('brand_name', :with => 'Puma')
    fill_in('brand_price', :with => '90')
    click_button('Submit')
    expect(page).to have_content('Puma')
  end
  it "allows users to create update and delete stores" do
    visit('/')
    click_link('Add Store')
    fill_in('store_name', :with => 'foot locker')
    click_button('Submit')
    expect(page).to have_content('Foot Locker')
    click_link('Foot Locker')
    click_link('Update Store')
    expect(page).to have_content('Update Store')
    fill_in('update_name', :with => 'footlocker')
    click_button('Update Store')
    expect(page).to have_content('Footlocker')
    click_button('Delete Store')
    expect(page).to have_content('To add stores')
  end
end
