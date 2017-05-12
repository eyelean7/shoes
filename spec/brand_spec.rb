require('spec_helper')

describe(Brand) do
  describe('#save') do
    it "will capitalize brand names" do
      puma = Brand.create(:name => 'puma', :price => 90)
      expect(puma.name).to eq('Puma')
    end
    it "will save price rounded to the nearest cent" do
      adidas = Brand.create(:name => 'adidas', :price => 70.2345)
      expect(adidas.price).to eq(70.23)
      puma = Brand.create(:name => 'puma', :price => 90)
      expect(puma.price).to eq(90.00)
    end

  end
end
