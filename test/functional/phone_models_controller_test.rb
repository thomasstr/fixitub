require 'test_helper'

class PhoneModelsControllerTest < ActionController::TestCase
  setup do
    @phone_model = phone_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_model" do
    assert_difference('PhoneModel.count') do
      post :create, phone_model: { name: @phone_model.name }
    end

    assert_redirected_to phone_model_path(assigns(:phone_model))
  end

  test "should show phone_model" do
    get :show, id: @phone_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phone_model
    assert_response :success
  end

  test "should update phone_model" do
    put :update, id: @phone_model, phone_model: { name: @phone_model.name }
    assert_redirected_to phone_model_path(assigns(:phone_model))
  end

  test "should destroy phone_model" do
    assert_difference('PhoneModel.count', -1) do
      delete :destroy, id: @phone_model
    end

    assert_redirected_to phone_models_path
  end
end
