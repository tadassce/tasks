require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
    @user = users(:adnilson)
  end

  test "should get index" do
    get todos_url, as: :json, headers: { authorization: "Token token=#{@user.api_key}" }
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { category: @todo.category, completed: @todo.completed, order: @todo.order, title: @todo.title, user_id: @todo.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show todo" do
    get todo_url(@todo), as: :json, headers: { authorization: "Token token=#{@user.api_key}" }
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { category: @todo.category, completed: @todo.completed, order: @todo.order, title: @todo.title, user_id: @todo.user_id } }, as: :json, headers: { authorization: "Token token=#{@user.api_key}" }
    assert_response 200
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo), as: :json, headers: { authorization: "Token token=#{@user.api_key}" }
    end

    assert_response 204
  end
end
