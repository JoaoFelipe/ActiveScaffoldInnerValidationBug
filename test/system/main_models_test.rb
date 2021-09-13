require "application_system_test_case"

class MainModelsTest < ApplicationSystemTestCase
  setup do
    @main_model = main_models(:one)
  end

  test "visiting the index" do
    visit main_models_url
    assert_selector "h1", text: "Main Models"
  end

  test "creating a Main model" do
    visit main_models_url
    click_on "New Main Model"

    fill_in "Title", with: @main_model.title
    click_on "Create Main model"

    assert_text "Main model was successfully created"
    click_on "Back"
  end

  test "updating a Main model" do
    visit main_models_url
    click_on "Edit", match: :first

    fill_in "Title", with: @main_model.title
    click_on "Update Main model"

    assert_text "Main model was successfully updated"
    click_on "Back"
  end

  test "destroying a Main model" do
    visit main_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Main model was successfully destroyed"
  end
end
