require "test_helper"

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get lista" do
    get list_lista_url
    assert_response :success
  end
end
