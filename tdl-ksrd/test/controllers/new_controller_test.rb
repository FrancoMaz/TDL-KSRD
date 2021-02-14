require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get registration" do
    get :registration
    assert_response :success
  end

end
