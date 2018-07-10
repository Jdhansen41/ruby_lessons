def caesar(word, num)
    #Using .split().map instead of .each because we need to alter each element and permanently change string
    input = word.split('').map { |c|
        #If char is within alphabet range, change it
        if c.ord > 64 && c.ord < 123
            c = c.ord+num #convert to ascii number and add num
            if c > 122 #hit z? wrap around to a
                c = c - 26
            end
            c= c.chr #convert ascii back to chr
        else
            c = c 
        end
    }
    puts input.join('') #join and output new string
    
end


caesar("Taco's galore", 2)