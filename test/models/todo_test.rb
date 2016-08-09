require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  def setup
    @user = users(:adnilson)
    @todo = Todo.create(title: "Finish API", completed: false, order: 1,
                        category: "work", user_id: @user.id)
  end
  
  test "should be valid" do
    assert @todo.valid?
  end

  test "user id should be present" do
    @todo.user_id = nil
    assert_not @todo.valid?
  end

  test "title should be present" do
    @todo.title = " "
    assert_not @todo.valid?
  end

  test "title should have 80 chars max" do
    @todo.title = 'o' * 81
    assert_not @todo.valid?
  end
end
