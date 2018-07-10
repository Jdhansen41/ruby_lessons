def substrings(string, dictionary)
    words= string.split(" ") #Split search term into array of words
    counts = Hash.new(0) #Creating a new hash
    words.each do |word| #For each word in input,
        count = 0  
        dictionary.each do |idx| #Cycle through every array element in dictionary
            if idx.include?(word) #If substring word appears in array element, increase count
                count = count + 1
            end
        end
        counts[word] = count #Assign count as the key in our counts array
    end
    puts counts
end

substrings("taco meat time", ["tacos", 'taco', 'jon', 'taco', 'meat'])