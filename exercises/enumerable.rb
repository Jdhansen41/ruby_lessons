module Enumerable
    def my_each
        i = 0
        while i < self.size #loop thru array method is called on
          yield(self[i]) #run given block where index value (self[i) is num
          i+=1
        end
    end
    
    def my_each_with_index
        i = 0
        while i < self.size
            yield(i,self[i])
            i+=1
        end
    end
    
    def my_select
       self.my_each_with_index{|x,value| self.delete(value) if yield(value) == false}
    end
    
    def my_all
       flag = true
       self.my_each{|x| 
        if yield(x) == false
           flag = false #break out of block and return false if any x fails yield
           break
        else
            flag = true
        end
       } 
       return flag
    end
    
    def my_any
       flag = false
       self.my_each{|x|
       if yield(x) == true
           flag = true
           break
       else
        flag = false
       end
       }
       return flag
    end
    
    def my_none
        flag = true
        self.my_each{|x|
        if yield(x) == true
            flag = false
            break
        else
            flag = true
        end
        }
        return flag
    end
    
    def my_count
       count = 0
       if block_given? #If block is provided, run it
           self.my_each{|x|
            if yield(x) == true
                count += 1
            end
           }
           return count
        else #if no block provided, return array length
          return self.length  
        end
    end
    
    def my_map(arg=nil) #Allows us to pass in Proc, if not given then assume block used
        arr = []
        if block_given? && arg == nil #If block given
           self.my_each{|x|
             arr.push(yield(x))
           }
        else#If proc given
            self.my_each{|x|
             arr.push(arg.call(x))
            }
        end
       return arr
    end
    
    def my_inject(num)
        sum = num
        self.my_each{|x|
            sum = yield(sum,x)
        }
        return sum
    end
end

#Method to test out my_inject
def multi_els(arr)
    puts arr.my_inject(1){|a,b| a*b}
end

