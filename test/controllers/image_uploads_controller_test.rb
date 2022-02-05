require "test_helper"

class ImageUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_upload = image_uploads(:one)
  end

  test "should get index" do
    get image_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_image_upload_url
    assert_response :success
  end

  test "should create image_upload" do
    assert_difference('ImageUpload.count') do
      post image_uploads_url, params: { image_upload: { name: @image_upload.name } }
    end

    assert_redirected_to image_upload_url(ImageUpload.last)
  end

  test "should show image_upload" do
    get image_upload_url(@image_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_upload_url(@image_upload)
    assert_response :success
  end

  test "should update image_upload" do
    patch image_upload_url(@image_upload), params: { image_upload: { name: @image_upload.name } }
    assert_redirected_to image_upload_url(@image_upload)
  end

  test "should destroy image_upload" do
    assert_difference('ImageUpload.count', -1) do
      delete image_upload_url(@image_upload)
    end

    assert_redirected_to image_uploads_url
  end
end
