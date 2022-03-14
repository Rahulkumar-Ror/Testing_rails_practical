require "rails_helper"

RSpec.describe Product, type: :model do
  it "is not valid with attributes" do
    expect(Product.new()).to_not be_valid
  end

  it "is valid with valid attributes" do
    @user = User.new(email: "test@gmail.com", password: "test123")
    @user.save!
    @product = @user.products.build(product_name: "first", description: "first product", price: 500)
    expect(@product).to be_valid
  end

  it "it must have product name when create a product" do
    @user = User.new(email: "test@gmail.com", password: "test123")
    @user.save!
    @product = @user.products.build(description: "first first", price: 500)
    expect(@product).to_not be_valid
  end

  it "product name must be unique" do
    @user = User.create(email: "test@gmail.com", password: "test123")
    @user.save!
    @product1 = @user.products.build(product_name: "second", description: "second product", price: 500)
    @product2 = @user.products.build(product_name: "second", description: "second product", price: 500)
    @product1.save
    @product2.save
    expect(@product2).to_not be_valid
  end

  it "must have a description" do
    @user = User.create(email: "test@gmail.com", password: "test123")
    @user.save!
    @product = @user.products.build(product_name: "second", price: 500)
    @product.save
    expect(@product).to_not be_valid
  end

  it "is must have price" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "first", description: "first first")
    expect(@product).to_not be_valid
  end

  it "it should be minimum length of product name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "f", description: "first first", price: 300)
    expect(@product).to_not be_valid
  end

  it "it should be maximum length of product name" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "abcdefghijklminhdkisndhkghjm", description: "first first", price: 300)
    expect(@product).to_not be_valid
  end

  it "it should be minimum length of description" do
    @user = User.new(email: "abc@gmail.com", password: "abc@123")
    @user.save!
    @product = @user.products.build(product_name: "first", description: "fsss", price: 300)
    expect(@product).to_not be_valid
  end

  it "factory bot" do
    product = FactoryBot.create(:product)
    expect(product).to be_valid
  end
end
