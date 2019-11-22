class CreateProductsPromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :products_promotions do |t|
      t.references :promotion, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
