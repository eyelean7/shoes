require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('./lib/brand')
require('./lib/store')
require('./lib/contract')



get('/') do
# binding.pry
  @brands = Brand.all()
  erb(:index)
end

get('/brand/new') do
  erb(:brand_form)
end

post('/brands') do
  brand_name = params.fetch("brand_name")
  brand_price = params.fetch("brand_price")
  brand = Brand.create(:name => brand_name, :price => brand_price)
  @brands = Brand.all()
  erb(:index)
end

  # store_name = params.fetch("store_name")

  # @stores = Store.all()
