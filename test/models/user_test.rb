require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should create user" do
    @user = User.new
    @user.email = "test@gmail.com"
    @user.password = "test123"
    assert @user.save
  end

  test "should have email " do
    @user = User.new
    @user.email = nil
    @user.password = "hakjdjsdhhdhh"
    assert_not @user.save
  end

  test "should have password " do
    @user = User.new
    @user.email = "ha@gmail.com"
    @user.password = nil
    assert_not @user.save
  end
end
