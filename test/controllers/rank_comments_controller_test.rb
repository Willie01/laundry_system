require 'test_helper'

class RankCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rank_comment = rank_comments(:one)
  end

  test "should get index" do
    get rank_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_rank_comment_url
    assert_response :success
  end

  test "should create rank_comment" do
    assert_difference('RankComment.count') do
      post rank_comments_url, params: { rank_comment: { comment: @rank_comment.comment, courier_rank: @rank_comment.courier_rank, factory_rank: @rank_comment.factory_rank, order_id: @rank_comment.order_id } }
    end

    assert_redirected_to rank_comment_url(RankComment.last)
  end

  test "should show rank_comment" do
    get rank_comment_url(@rank_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_rank_comment_url(@rank_comment)
    assert_response :success
  end

  test "should update rank_comment" do
    patch rank_comment_url(@rank_comment), params: { rank_comment: { comment: @rank_comment.comment, courier_rank: @rank_comment.courier_rank, factory_rank: @rank_comment.factory_rank, order_id: @rank_comment.order_id } }
    assert_redirected_to rank_comment_url(@rank_comment)
  end

  test "should destroy rank_comment" do
    assert_difference('RankComment.count', -1) do
      delete rank_comment_url(@rank_comment)
    end

    assert_redirected_to rank_comments_url
  end
end
