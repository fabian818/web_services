class Product < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :brand

  has_one :specification
end
