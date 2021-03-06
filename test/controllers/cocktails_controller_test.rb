require "test_helper"

class CocktailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cocktails_index_url
    assert_response :success
  end

  test "should get show" do
    get cocktails_show_url
    assert_response :success
  end

  test "should get new" do
    get cocktails_new_url
    assert_response :success
  end

  test "should get create" do
    get cocktails_create_url
    assert_response :success
  end
end
