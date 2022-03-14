require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = User.create!(email: "test@gmail.com", password: "test123")
    sign_in @user

    @product = @user.products.create!(product_name: "cosmetic", price: 1299, description: "this is an product")
  end

  test "product name should be present" do
    @product.product_name = " "
    assert_not @product.valid?
  end

  test "should not allow duplicate product name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product1 = @user.products.build(product_name: "abcd", price: "50", description: "hellllllllo")
    @product2 = @user.products.build(product_name: "abcd", price: "500", description: "helllslllllo")
    @product1.save
    assert_not @product2.save, "Saved a duplicate product name"
  end

  test " price should be present" do
    @product.price = nil
    assert_not @product.valid?
  end

  test " description should be present" do
    @product.description = nil
    assert_not @product.valid?
  end

  test "should have create a product" do
    @product.product_name = "hello"
    @product.price = "1"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert @product.save
  end

  test "should have minimum length of product name" do
    @product.product_name = "h"
    @product.price = "1000"
    @product.description = "hello Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end

  test "should have minimum length of description" do
    @product.product_name = "hello"
    @product.price = "1"
    @product.description = "Rails"
    @product.user_id = @user.id
    assert_not @product.save
  end
end
