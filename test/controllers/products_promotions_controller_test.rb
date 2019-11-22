require 'test_helper'

class ProductsPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_promotion = products_promotions(:one)
  end

  test "should get index" do
    get products_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_products_promotion_url
    assert_response :success
  end

  test "should create products_promotion" do
    assert_difference('ProductsPromotion.count') do
      post products_promotions_url, params: { products_promotion: { product_id: @products_promotion.product_id, promotion_id: @products_promotion.promotion_id } }
    end

    assert_redirected_to products_promotion_url(ProductsPromotion.last)
  end

  test "should show products_promotion" do
    get products_promotion_url(@products_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_products_promotion_url(@products_promotion)
    assert_response :success
  end

  test "should update products_promotion" do
    patch products_promotion_url(@products_promotion), params: { products_promotion: { product_id: @products_promotion.product_id, promotion_id: @products_promotion.promotion_id } }
    assert_redirected_to products_promotion_url(@products_promotion)
  end

  test "should destroy products_promotion" do
    assert_difference('ProductsPromotion.count', -1) do
      delete products_promotion_url(@products_promotion)
    end

    assert_redirected_to products_promotions_url
  end
end
