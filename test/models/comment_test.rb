require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "update object that belongs_to :record and a has_one association" do
    comment = Comment.create!(record: Record.new, response: Response.new)
    comment.save! # This line raises wrong number of arguments (given 3, expected 0)
  end
end
