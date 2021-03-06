class Store < ActiveRecord::Base
  has_many :contracts
  has_many :brands, through: :contracts

  validates(:name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  before_save(:make_title)

  private

  def make_title
    title = self.name.split(/ |\_|\-/).map(&:capitalize).join(" ")
    self.name = title
  end

end
