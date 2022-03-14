require "rails_helper"

RSpec.describe User, type: :model do
  it "should create user" do
    @user = User.create(email: "test@gmail.com", password: "test123")
    @user.save!
    expect(@user).to be_valid
  end

  it "should must have email" do
    @user = User.create(password: "test123")
    @user.save
    expect(@user).to_not be_valid
  end

  it "should must have password" do
    @user = User.new
    @user.email = "test@gmail.com"
    @user.password = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it "checked factory bot" do
    @user = FactoryBot.create(:user)
    expect(@user).to be_valid
  end
end
