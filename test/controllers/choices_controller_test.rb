require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get choices_new_url
    assert_response :success
  end

end
