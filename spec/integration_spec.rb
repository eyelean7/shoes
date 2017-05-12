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
end
