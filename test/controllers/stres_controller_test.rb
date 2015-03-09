require 'test_helper'

class StresControllerTest < ActionController::TestCase
  setup do
    @stre = stres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stre" do
    assert_difference('Stre.count') do
      post :create, stre: { content: @stre.content, title: @stre.title }
    end

    assert_redirected_to stre_path(assigns(:stre))
  end

  test "should show stre" do
    get :show, id: @stre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stre
    assert_response :success
  end

  test "should update stre" do
    patch :update, id: @stre, stre: { content: @stre.content, title: @stre.title }
    assert_redirected_to stre_path(assigns(:stre))
  end

  test "should destroy stre" do
    assert_difference('Stre.count', -1) do
      delete :destroy, id: @stre
    end

    assert_redirected_to stres_path
  end
end
