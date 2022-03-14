require "rails_helper"

RSpec.describe Product, type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(email: "tefdst@gmail.com", password: "test123")
    @user.save
    sign_in @user
  end

  it "gets all products" do
    get products_path
    expect(response).to be_successful
  end

  it "has to show particular product" do
    product = FactoryBot.create(:product)
    get product_path(product)
    expect(response).to be_successful
  end

  it "has to create new product" do
    product = FactoryBot.create(:product)
    get new_product_path(product)
    expect(response).to be_successful
  end

  it "has to edit particular product" do
    product = FactoryBot.create(:product)
    get edit_product_path(product.id)
    expect(response).to_not be_successful
  end

  it "should delete" do
    product = FactoryBot.create(:product)
    product.destroy
    expect(Product.find_by(product_name: "rahul kumar")).to be_nil
  end
end
