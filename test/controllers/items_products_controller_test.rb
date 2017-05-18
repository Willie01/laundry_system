require 'test_helper'

class ItemsProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_product = items_products(:one)
  end

  test "should get index" do
    get items_products_url
    assert_response :success
  end

  test "should get new" do
    get new_items_product_url
    assert_response :success
  end

  test "should create items_product" do
    assert_difference('ItemsProduct.count') do
      post items_products_url, params: { items_product: { item_number: @items_product.item_number, item_price: @items_product.item_price, logistics_status: @items_product.logistics_status, product_id: @items_product.product_id, status: @items_product.status } }
    end

    assert_redirected_to items_product_url(ItemsProduct.last)
  end

  test "should show items_product" do
    get items_product_url(@items_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_items_product_url(@items_product)
    assert_response :success
  end

  test "should update items_product" do
    patch items_product_url(@items_product), params: { items_product: { item_number: @items_product.item_number, item_price: @items_product.item_price, logistics_status: @items_product.logistics_status, product_id: @items_product.product_id, status: @items_product.status } }
    assert_redirected_to items_product_url(@items_product)
  end

  test "should destroy items_product" do
    assert_difference('ItemsProduct.count', -1) do
      delete items_product_url(@items_product)
    end

    assert_redirected_to items_products_url
  end
end
