class Department < ApplicationRecord
	has_many :products, dependent: :destroy

  def self.get_products(search)
    find_by("name LIKE ?", "%#{search}%").try(:products)
  end

end
