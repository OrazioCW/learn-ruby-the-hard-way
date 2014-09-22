module Dict                              # => Create module dictionary     
  def Dict.new(num_buckets=256)			 # => Define size of the dictionary
    # Initializes a Dict with the given number of buckets.
    aDict = []							 # => assign an empty array 
    (0...num_buckets).each do |i|		 # => for 0 to 255 ,or number given by user, add empty array to the array
      aDict.push([])
    end

    return aDict						# => return the array of arrays
  end

  def Dict.hash_key(aDict, key)			   
    # Given a key this will create a number and then convert it to
    # an index for the aDict's buckets.
    return key.hash % aDict.length		# => this return concatenated the hashed key and the length of the value or {	example - 3 % 2 == 1  2 % 2 == 0 }
  end

  def Dict.get_bucket(aDict, key)		# => use key to return position of a value and key from a bucket 
    # Given a key, find the bucket where it would go.
    bucket_id = Dict.hash_key(aDict, key)
    return aDict[bucket_id]
  end

  def Dict.get_slot(aDict, key, default=nil)
    # Returns the index, key, and value of a slot found in a bucket.
    bucket = Dict.get_bucket(aDict, key)

    bucket.each_with_index do |kv, i|	# => for each 
      k, v = kv
      if key == k						# => if the key exists 
        return i, k, v					# =>  return index, key and value
      end
    end

    return -1, key, default				# => if not return -1 which mean does not exist add new slot 
  end

  def Dict.get(aDict, key, default=nil)			# => return a value from given bucket and key
    # Gets the value in a bucket for the given key, or the default.
    i, k, v = Dict.get_slot(aDict, key, default=default)			
    return v
  end

  def Dict.set(aDict, key, value)
    # Sets the key to the value, replacing any existing value.
    bucket = Dict.get_bucket(aDict, key)			# => get the bucket by the key
    i, k, v = Dict.get_slot(aDict, key)				# => get the index key and value

    if i >= 0										# => if item exist
      bucket[i] = [key, value]						# => edit
    else
      bucket.push([key, value])						# => if not add
    end
  end

  def Dict.delete(aDict, key)       			# => delete item by key		
    # Deletes the given key from the Dict.
    bucket = Dict.get_bucket(aDict, key)			# => get item index

    (0...bucket.length).each do |i|					
      k, v = bucket[i]								# => split to k and v
      if key == k									# => if k equal key delete the value
        bucket.delete_at(i)
        break
      end
    end
  end

  def Dict.list(aDict)
    # Prints out what's in the Dict.
    aDict.each do |bucket|				# => for each bucket in bucket
      if bucket							# => if is not nil
        bucket.each {|k, v| puts k, v}	# => show key and value
      end
    end
  end
end