class Promotion < ApplicationRecord
  has_many :products_promotions, dependent: :destroy
  has_many :products, through: :products_promotions
end
