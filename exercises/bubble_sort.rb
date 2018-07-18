x = [3,4,5,1,2,5]

def bubble_sort(arr)
   loop do
   swapped = false
   (1...arr.length).each { |num|
      if arr[num] < arr[num-1]
         arr[num], arr[num-1] = arr[num-1], arr[num] #swap values
         swapped = true #turn swapped flag to true
      end
   }
      if !swapped
         break #exit loop if we've gone through array without swapping
      end
   end 
   return arr.inspect #.inspect to output array neatly
end

puts bubble_sort(x)