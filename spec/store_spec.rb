require('spec_helper')

describe(Store) do
  describe('#save') do
    it "will capitalize store names" do
      dsw = Store.create(:name => 'designer shoe warehouse')
      expect(dsw.name).to eq('Designer Shoe Warehouse')
    end

  end
end
