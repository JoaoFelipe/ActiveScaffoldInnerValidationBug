require "test_helper"

class ChildModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_model = child_models(:one)
  end

  test "should get index" do
    get child_models_url
    assert_response :success
  end

  test "should get new" do
    get new_child_model_url
    assert_response :success
  end

  test "should create child_model" do
    assert_difference('ChildModel.count') do
      post child_models_url, params: { child_model: { fail: @child_model.fail, main_model_id: @child_model.main_model_id } }
    end

    assert_redirected_to child_model_url(ChildModel.last)
  end

  test "should show child_model" do
    get child_model_url(@child_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_child_model_url(@child_model)
    assert_response :success
  end

  test "should update child_model" do
    patch child_model_url(@child_model), params: { child_model: { fail: @child_model.fail, main_model_id: @child_model.main_model_id } }
    assert_redirected_to child_model_url(@child_model)
  end

  test "should destroy child_model" do
    assert_difference('ChildModel.count', -1) do
      delete child_model_url(@child_model)
    end

    assert_redirected_to child_models_url
  end
end
