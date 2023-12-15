require "test_helper"

class FellowshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fellowships_show_url
    assert_response :success
  end

  test "should get new" do
    get fellowships_new_url
    assert_response :success
  end

  test "should get create" do
    get fellowships_create_url
    assert_response :success
  end

  test "should get delete" do
    get fellowships_delete_url
    assert_response :success
  end
end
