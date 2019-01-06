require "test/unit"

require "node"

class NodeTest < Test::Unit::TestCase
  def test_should_point_to_nil_by_default
    assert_nil Node.new("1").next
  end
end
