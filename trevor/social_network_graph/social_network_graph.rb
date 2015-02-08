require 'csv'

class WeightedUnionFind

  def initialize(*members)
    @num_roots = 0
    @graph = {}
    @sizes = {}
    members.each { |member| add_user(member) }
  end
  
  def union(user1, user2)
  
    root1 = root(user1)
    root2 = root(user2)
  
    # if the nodes had different roots, they don't now
    if root1 != root2
    
      # decrement the root count
      @num_roots -= 1
    
      # optimisation which makes the algorithm O(log n) instead of O(n)
      # by keeping the depth of the tree from each root as even as possible
      if @sizes[root1] < @sizes[root2]
        @graph[root1] = root2
        @sizes[root2] += @sizes[root1]
      else
        @graph[root2] = root1
        @sizes[root1] += @sizes[root2]      
      end
    
    end
    
  end
 
  def all_connected?
    return @num_roots == 1  
  end
  
  def is_connected?(user1, user2)
    return root(user1) == root(user2)
  end
  
  private

    def add_user(user)
      @num_roots += 1
      @graph[user] = user
      @sizes[user] = 1
    end
  
    def root(user)
      while user != @graph[user]
        user = @graph[user]
      end
      return user
    end

end



class SocialNetworkGraph

  def initialize(*members)
    @wuf = WeightedUnionFind.new(*members)
    @timestamp = ''
  end
  
  def parse_log(filename)
    CSV.foreach(filename, {:col_sep => " "}) do |row|
      timestamp, user1, user2 = row[0], row[1].to_sym, row[2].to_sym      
      @wuf.union(user1, user2)  
      if @wuf.all_connected?
        @timestamp = timestamp
        break
      end
    end
  end

  attr_reader :timestamp

end


