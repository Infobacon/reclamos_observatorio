require 'test_helper'

class FiltrosControllerTest < ActionController::TestCase
  setup do
    @filtro = filtros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filtros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filtro" do
    assert_difference('Filtro.count') do
      post :create, filtro: { termino: @filtro.termino, tipo: @filtro.tipo }
    end

    assert_redirected_to filtro_path(assigns(:filtro))
  end

  test "should show filtro" do
    get :show, id: @filtro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filtro
    assert_response :success
  end

  test "should update filtro" do
    patch :update, id: @filtro, filtro: { termino: @filtro.termino, tipo: @filtro.tipo }
    assert_redirected_to filtro_path(assigns(:filtro))
  end

  test "should destroy filtro" do
    assert_difference('Filtro.count', -1) do
      delete :destroy, id: @filtro
    end

    assert_redirected_to filtros_path
  end
end
