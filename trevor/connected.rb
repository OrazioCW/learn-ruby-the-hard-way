class UF

  def initialize(n)
    @nodes = {}
    for n in 0...n
      @nodes[n] = Node.new(n)
    end
  end

  def union(p, q)
    @nodes[p].connect(@nodes[q])
  end

  def connected(p, q)
    return @nodes[p].connected(q, {})
  end
end

class Node

  attr_reader :index

  def initialize(n)
    @index = n
    @connections = {}
  end

  def connect(node)
    @connections[node.index] = node
  end

  def connected(node_index, visited)

    connected = @connections[node_index] != nil && visited[node_index] == nil
    if connected
      return true
    end

    visited[@index] = true
    @connections.each do |index, node|
       if !visited[index]
        connected = node.connected(node_index, visited)
        if connected
          return true
        end
      end
    end

    return false
  end

end

uf = UF.new(8)
uf.union(1, 4)
uf.union(2, 3)
uf.union(2, 6)
uf.union(3, 6)
uf.union(4, 5)
uf.union(6, 7)

connected = uf.connected(1, 5)

puts "Connected: #{connected}"

