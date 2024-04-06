require "test_helper"

class BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get Bikes" do
    get bikes_Bikes_url
    assert_response :success
  end
end
