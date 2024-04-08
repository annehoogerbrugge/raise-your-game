require "test_helper"

class PlayThroughsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play_through = play_throughs(:one)
  end

  test "should get index" do
    get play_throughs_url, as: :json
    assert_response :success
  end

  test "should create play_through" do
    assert_difference("PlayThrough.count") do
      post play_throughs_url, params: { play_through: { score: @play_through.score, time_spent: @play_through.time_spent } }, as: :json
    end

    assert_response :created
  end

  test "should show play_through" do
    get play_through_url(@play_through), as: :json
    assert_response :success
  end

  test "should update play_through" do
    patch play_through_url(@play_through), params: { play_through: { score: @play_through.score, time_spent: @play_through.time_spent } }, as: :json
    assert_response :success
  end

  test "should destroy play_through" do
    assert_difference("PlayThrough.count", -1) do
      delete play_through_url(@play_through), as: :json
    end

    assert_response :no_content
  end
end
