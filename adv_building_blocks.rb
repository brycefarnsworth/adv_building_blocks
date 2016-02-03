# Project 1: Bubble Sort

=begin
Task 1:
Build a bubble sort method that takes an array and returns a sorted
array.
=end

def bubble_sort(array)
	sorted = false		# Set sorted to false to enter loop
	until sorted
		sorted = true	# Assume it's sorted until we see otherwise
		0.upto(array.length - 2) do |i|
		# Look at each pair of adjacent elements
			if array[i] > array[i+1]
			# If the latter is greater than the former:
				# Swap values
				tmp = array[i]
				array[i] = array[i+1]
				array[i+1] = tmp
				# Array was not sorted; set sorted to false and
				# see if it's now sorted.
				sorted = false
			end
		end
	end
	# Array is now sorted
	array				# Return array
end

puts "#{bubble_sort([5, 8, 3, 2, 9, 6, 1])}"
puts "#{bubble_sort([2, 3, 1, 6, 5, 9, 2])}"