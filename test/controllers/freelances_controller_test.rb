require 'test_helper'

class FreelancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get freelances_new_url
    assert_response :success
  end

end
