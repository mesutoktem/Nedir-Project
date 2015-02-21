require 'test_helper'

class PatternTypesControllerTest < ActionController::TestCase
  setup do
    @pattern_type = pattern_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pattern_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pattern_type" do
    assert_difference('PatternType.count') do
      post :create, pattern_type: { name: @pattern_type.name, pattern_text: @pattern_type.pattern_text }
    end

    assert_redirected_to pattern_type_path(assigns(:pattern_type))
  end

  test "should show pattern_type" do
    get :show, id: @pattern_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pattern_type
    assert_response :success
  end

  test "should update pattern_type" do
    patch :update, id: @pattern_type, pattern_type: { name: @pattern_type.name, pattern_text: @pattern_type.pattern_text }
    assert_redirected_to pattern_type_path(assigns(:pattern_type))
  end

  test "should destroy pattern_type" do
    assert_difference('PatternType.count', -1) do
      delete :destroy, id: @pattern_type
    end

    assert_redirected_to pattern_types_path
  end
end
