require 'test_helper'

class DiccionariosControllerTest < ActionController::TestCase
  setup do
    @diccionario = diccionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diccionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diccionario" do
    assert_difference('Diccionario.count') do
      post :create, diccionario: { Terminos: @diccionario.Terminos }
    end

    assert_redirected_to diccionario_path(assigns(:diccionario))
  end

  test "should show diccionario" do
    get :show, id: @diccionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diccionario
    assert_response :success
  end

  test "should update diccionario" do
    patch :update, id: @diccionario, diccionario: { Terminos: @diccionario.Terminos }
    assert_redirected_to diccionario_path(assigns(:diccionario))
  end

  test "should destroy diccionario" do
    assert_difference('Diccionario.count', -1) do
      delete :destroy, id: @diccionario
    end

    assert_redirected_to diccionarios_path
  end
end
