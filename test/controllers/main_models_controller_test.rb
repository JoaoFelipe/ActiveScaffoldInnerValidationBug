require "test_helper"

class MainModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_model = main_models(:one)
  end

  test "should get index" do
    get main_models_url
    assert_response :success
  end

  test "should get new" do
    get new_main_model_url
    assert_response :success
  end

  test "should create main_model" do
    assert_difference('MainModel.count') do
      post main_models_url, params: { main_model: { title: @main_model.title } }
    end

    assert_redirected_to main_model_url(MainModel.last)
  end

  test "should show main_model" do
    get main_model_url(@main_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_model_url(@main_model)
    assert_response :success
  end

  test "should update main_model" do
    patch main_model_url(@main_model), params: { main_model: { title: @main_model.title } }
    assert_redirected_to main_model_url(@main_model)
  end

  test "should destroy main_model" do
    assert_difference('MainModel.count', -1) do
      delete main_model_url(@main_model)
    end

    assert_redirected_to main_models_url
  end
end
