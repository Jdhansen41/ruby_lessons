module Enumerable
    def my_each
        i = 0
        while i < self.size #loop thru array method is called on
          yield(self[i]) #run given block where index value (self[i) is num
          i+=1
        end
    end
  end
 
 
