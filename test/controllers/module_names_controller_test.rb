require "test_helper"

class ModuleNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @module_name = module_names(:one)
  end

  test "should get index" do
    get module_names_url
    assert_response :success
  end

  test "should get new" do
    get new_module_name_url
    assert_response :success
  end

  test "should create module_name" do
    assert_difference('ModuleName.count') do
      post module_names_url, params: { module_name: { class_name_id: @module_name.class_name_id, name: @module_name.name } }
    end

    assert_redirected_to module_name_url(ModuleName.last)
  end

  test "should show module_name" do
    get module_name_url(@module_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_module_name_url(@module_name)
    assert_response :success
  end

  test "should update module_name" do
    patch module_name_url(@module_name), params: { module_name: { class_name_id: @module_name.class_name_id, name: @module_name.name } }
    assert_redirected_to module_name_url(@module_name)
  end

  test "should destroy module_name" do
    assert_difference('ModuleName.count', -1) do
      delete module_name_url(@module_name)
    end

    assert_redirected_to module_names_url
  end
end
