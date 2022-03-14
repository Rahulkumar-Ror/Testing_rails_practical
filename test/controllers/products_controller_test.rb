require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = User.create(email: "tesss@gmail.com", password: "tessss123", password_confirmation: "tessss123")
    @user.save
    @product = @user.products.create(product_name: "sfdghjjk", price: 3000, description: "this is am product")
  end

  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should get new" do
    get product_path(@product)
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_path, params: { product: { product_name: "def", description: "descripionnnn", price: "600", user_id: @user.id } }
    end
    assert_redirected_to products_path
  end

  test " should get edit" do
    sign_in @user
    get edit_product_path(@product.id)
    assert_response :success
  end
  test " should get show a particular product" do
    get product_path(@product.id)
    assert_response :success
  end

  test "should update a product" do
    sign_in @user
    put product_path(@product.id), params: { product: { product_name: "asdfghj", price: 4000, description: "sfgfrgfdfgf", user_id: @user.id } }
    assert Product.find_by(product_name: "toys")
  end

  test "should get delete" do
    sign_in @user
    delete product_path(@product.id)
    follow_redirect!
    assert_nil assigns(:product)
  end
end
