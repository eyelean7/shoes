class Brand < ActiveRecord::Base
  has_many :contracts
  has_many :stores, through: :contracts

  validates(:name, :presence => true)
  validates(:name, :uniqueness => true)
  before_save(:make_title)
  before_save(:make_price)

  private

  def make_title
    title = self.name.split(/ |\_|\-/).map(&:capitalize).join(" ")
    self.name = title
  end
  def make_price
    self.price = self.price.round(2)
  end
end
