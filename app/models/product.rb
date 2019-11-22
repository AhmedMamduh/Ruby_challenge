class Product < ApplicationRecord
  belongs_to :department
  has_many :products_promotions, dependent: :destroy
  has_many :promotions, through: :products_promotions

  def self.search_by_name(product_name)
    where("lower(name) LIKE ?", "%#{product_name.downcase}%")
  end

end
