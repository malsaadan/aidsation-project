require 'test_helper'

class SponsorshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sponsorships_index_url
    assert_response :success
  end

end
