require 'test_helper'

class AccessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get accesses_new_url
    assert_response :success
  end

end
