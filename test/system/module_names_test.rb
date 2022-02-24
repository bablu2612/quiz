require "application_system_test_case"

class ModuleNamesTest < ApplicationSystemTestCase
  setup do
    @module_name = module_names(:one)
  end

  test "visiting the index" do
    visit module_names_url
    assert_selector "h1", text: "Module Names"
  end

  test "creating a Module name" do
    visit module_names_url
    click_on "New Module Name"

    fill_in "Class name", with: @module_name.class_name_id
    fill_in "Name", with: @module_name.name
    click_on "Create Module name"

    assert_text "Module name was successfully created"
    click_on "Back"
  end

  test "updating a Module name" do
    visit module_names_url
    click_on "Edit", match: :first

    fill_in "Class name", with: @module_name.class_name_id
    fill_in "Name", with: @module_name.name
    click_on "Update Module name"

    assert_text "Module name was successfully updated"
    click_on "Back"
  end

  test "destroying a Module name" do
    visit module_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Module name was successfully destroyed"
  end
end
