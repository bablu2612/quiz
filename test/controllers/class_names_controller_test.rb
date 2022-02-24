require "test_helper"

class ClassNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_name = class_names(:one)
  end

  test "should get index" do
    get class_names_url
    assert_response :success
  end

  test "should get new" do
    get new_class_name_url
    assert_response :success
  end

  test "should create class_name" do
    assert_difference('ClassName.count') do
      post class_names_url, params: { class_name: { name: @class_name.name } }
    end

    assert_redirected_to class_name_url(ClassName.last)
  end

  test "should show class_name" do
    get class_name_url(@class_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_name_url(@class_name)
    assert_response :success
  end

  test "should update class_name" do
    patch class_name_url(@class_name), params: { class_name: { name: @class_name.name } }
    assert_redirected_to class_name_url(@class_name)
  end

  test "should destroy class_name" do
    assert_difference('ClassName.count', -1) do
      delete class_name_url(@class_name)
    end

    assert_redirected_to class_names_url
  end
end
