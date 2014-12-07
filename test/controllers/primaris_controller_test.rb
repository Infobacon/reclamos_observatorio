require 'test_helper'

class PrimarisControllerTest < ActionController::TestCase
  setup do
    @primari = primaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primari" do
    assert_difference('Primari.count') do
      post :create, primari: {  }
    end

    assert_redirected_to primari_path(assigns(:primari))
  end

  test "should show primari" do
    get :show, id: @primari
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primari
    assert_response :success
  end

  test "should update primari" do
    patch :update, id: @primari, primari: {  }
    assert_redirected_to primari_path(assigns(:primari))
  end

  test "should destroy primari" do
    assert_difference('Primari.count', -1) do
      delete :destroy, id: @primari
    end

    assert_redirected_to primaris_path
  end
end
