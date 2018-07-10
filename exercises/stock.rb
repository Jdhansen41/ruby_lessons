def stock_picker(input)
    lowest = input[0]
    lowIdx = 0
    rtnLowIdx = 0
    min = 0
    rtnIdx = 0
    profit = 0
    #max_profit = highest - lowest
    input.each_with_index { |val, idx|
        
        if val < lowest 
            lowest = val
            lowIdx = idx
        end    
        if val - lowest > profit
            rtnIdx = idx
            rtnLowIdx = lowIdx
            profit = val - lowest
            min = lowest
        end
         
    }
    puts "Buy on day #{rtnLowIdx} and sell on day #{rtnIdx} for a profit of $#{profit}"
end

stock_picker([17,3,6,9,15,8,6,1,18])