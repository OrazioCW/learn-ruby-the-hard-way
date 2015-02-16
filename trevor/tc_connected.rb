require "./connected"
require "test/unit"

class ConnectedTest < Test::Unit::TestCase

  def setup
    @uf = UF.new(8)
    @uf.union(1, 4)
    @uf.union(2, 3)
    @uf.union(2, 6)
    @uf.union(3, 6)
    @uf.union(4, 5)
    @uf.union(6, 7)
  end

  def test_direct_connections
    assert_equal(true, @uf.connected(1, 4))
    assert_equal(true, @uf.connected(2, 3))
    assert_equal(true, @uf.connected(2, 6))
    assert_equal(true, @uf.connected(3, 6))
    assert_equal(true, @uf.connected(4, 5))
    assert_equal(true, @uf.connected(6, 7))
  end

  def test_indirect_connections
    assert_equal(true, @uf.connected(1, 5))
    assert_equal(true, @uf.connected(2, 7))
    assert_equal(true, @uf.connected(3, 7))
  end

  def test_unconnected
    assert_equal(false, @uf.connected(0, 1))
    assert_equal(false, @uf.connected(0, 2))
    assert_equal(false, @uf.connected(0, 3))
    assert_equal(false, @uf.connected(0, 4))
    assert_equal(false, @uf.connected(0, 5))
    assert_equal(false, @uf.connected(0, 6))
    assert_equal(false, @uf.connected(0, 7))
    assert_equal(false, @uf.connected(1, 2))
    assert_equal(false, @uf.connected(1, 3))
    assert_equal(false, @uf.connected(1, 6))
    assert_equal(false, @uf.connected(1, 7))
    assert_equal(false, @uf.connected(2, 4))
    assert_equal(false, @uf.connected(2, 5))
    assert_equal(false, @uf.connected(3, 4))
    assert_equal(false, @uf.connected(3, 5))
    assert_equal(false, @uf.connected(4, 6))
    assert_equal(false, @uf.connected(4, 7))
    assert_equal(false, @uf.connected(5, 6))
    assert_equal(false, @uf.connected(5, 7))
  end
end