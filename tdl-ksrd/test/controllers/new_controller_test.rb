require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

end
