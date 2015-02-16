require "./social_network_graph"
require "test/unit"

class SocialNetworkGraphTest < Test::Unit::TestCase

  def setup
    @sng = SocialNetworkGraph.new(:orazio, :gus, :trevor, :duncan, :tim, :peet)
  end

  def test_log_file_parsing
    @sng.parse_log('test_friendships.log')
    assert_equal('20141026-0900', @sng.timestamp)
  end

end

class WeightedUnionFindTest < Test::Unit::TestCase

  def setup
    @uf = WeightedUnionFind.new(:orazio, :gus, :trevor, :duncan, :tim, :peet)
    @uf.union(:orazio, :gus)
    @uf.union(:duncan, :gus)
    @uf.union(:trevor, :orazio)
    @uf.union(:tim, :peet)
  end

  def test_direct_connections
    assert_equal(true, @uf.is_connected?(:orazio, :gus))
    assert_equal(true, @uf.is_connected?(:tim, :peet))
  end

  def test_indirect_connections
    assert_equal(true, @uf.is_connected?(:trevor, :duncan))
    assert_equal(true, @uf.is_connected?(:gus, :trevor))
  end

  def test_unconnected
    assert_equal(false, @uf.is_connected?(:tim, :gus))
    assert_equal(false, @uf.is_connected?(:peet, :duncan))
  end
  
  def test_all_connected
    assert_equal(false, @uf.all_connected?)
    @uf.union(:trevor, :tim)
    assert_equal(true, @uf.all_connected?)
  end
  
end
