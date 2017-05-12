
class Contract < ActiveRecord::Base
  has_many :brands
  has_many :stores
end
