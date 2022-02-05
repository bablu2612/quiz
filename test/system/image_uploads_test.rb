require "application_system_test_case"

class ImageUploadsTest < ApplicationSystemTestCase
  setup do
    @image_upload = image_uploads(:one)
  end

  test "visiting the index" do
    visit image_uploads_url
    assert_selector "h1", text: "Image Uploads"
  end

  test "creating a Image upload" do
    visit image_uploads_url
    click_on "New Image Upload"

    fill_in "Name", with: @image_upload.name
    click_on "Create Image upload"

    assert_text "Image upload was successfully created"
    click_on "Back"
  end

  test "updating a Image upload" do
    visit image_uploads_url
    click_on "Edit", match: :first

    fill_in "Name", with: @image_upload.name
    click_on "Update Image upload"

    assert_text "Image upload was successfully updated"
    click_on "Back"
  end

  test "destroying a Image upload" do
    visit image_uploads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image upload was successfully destroyed"
  end
end
