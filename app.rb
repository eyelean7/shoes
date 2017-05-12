require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('./lib/brand')
require('./lib/store')
require('./lib/contract')



get('/') do
  @brands = Brand.all()
  @stores = Store.all()
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
  redirect('/')
end

get('/brand/:id') do
  @stores = Store.all()
  @brand = Brand.find(params.fetch("id").to_i)
  erb(:brand)
end

get('/store/new') do
  erb(:store_form)
end

post('/stores') do
  store_name = params.fetch("store_name")
  store = Store.create(:name => store_name)
  @stores = Store.all()
  redirect('/')
end

get('/store/:id') do
  @brands = Brand.all()
  @store = Store.find(params.fetch("id").to_i)
  erb(:store)
end
