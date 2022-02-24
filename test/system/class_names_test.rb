require "application_system_test_case"

class ClassNamesTest < ApplicationSystemTestCase
  setup do
    @class_name = class_names(:one)
  end

  test "visiting the index" do
    visit class_names_url
    assert_selector "h1", text: "Class Names"
  end

  test "creating a Class name" do
    visit class_names_url
    click_on "New Class Name"

    fill_in "Name", with: @class_name.name
    click_on "Create Class name"

    assert_text "Class name was successfully created"
    click_on "Back"
  end

  test "updating a Class name" do
    visit class_names_url
    click_on "Edit", match: :first

    fill_in "Name", with: @class_name.name
    click_on "Update Class name"

    assert_text "Class name was successfully updated"
    click_on "Back"
  end

  test "destroying a Class name" do
    visit class_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class name was successfully destroyed"
  end
end
