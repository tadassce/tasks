require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:adnilson)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "u"* 244 + "@stagelink.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w(user@example.com foo@Bar.COM one_two@tree.for.fi
                         blan.dan@whooper.cr locust+sweet@blaz.de)
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w(user@example,com foo_at_baz.com user.one@three.
                           brob@na_sab.cv vrom@cr+om.dr)
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
  end

  test "email should unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
end
