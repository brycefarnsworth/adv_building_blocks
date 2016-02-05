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

=begin
Task 2:
Create "bubble_sort_by", which sorts an array but accepts a block.
The block should take two elements currently being compared. If the
result of the block is negative, the element on the left should go
before the element on the right.
=end

def bubble_sort_by(array)
	sorted = false		# Set sorted to false to enter loop
	until sorted
		sorted = true	# Assume it's sorted until we see otherwise
		0.upto(array.length - 2) do |i|
		# Look at each pair of adjacent elements
			if block_given?
			# If block is given, use its comparator:
				compare = yield(array[i], array[i+1])	# Pass two elements from array to block
				if compare > 0
				# If the result is positive:
					# Swap values
					tmp = array[i]
					array[i] = array[i+1]
					array[i+1] = tmp
					# Array was not sorted; set sorted to false and
					# see if it's now sorted.
					sorted = false
				# Else it's in order
				end
			else
			# Else default to standard bubble sort
				array = bubble_sort(array)
			end
		end
	end
	# Array is now sorted
	array				# Return array
end

#puts "#{bubble_sort_by(["hi", "hello", "hey"]) { |left, right| left.length - right.length }}"
#puts "#{bubble_sort_by([5, 8, 2, 3, 1, 6]) { |x, y| y - x }}"

# Project 2: Enumerable Methods

# Implement various methods in the existing Enumerable module:

module Enumerable
	# my_each, which works exactly like each
	def my_each
		# Return Enumerator if no block given
		return self.enum_for(:my_each) unless block_given?
		# Otherwise pass each element to block
		self_array = self.to_a
		0.upto(self_array.length-1) do |i|
			yield self_array[i]
		end
		self
	end
	
	# my_each_with_index = each_with_index
	def my_each_with_index
		# Same as my_each...
		return self.enum_for(:my_each_with_index) unless block_given?
		self_array = self.to_a
		0.upto(self_array.length-1) do |i|
			# ...except pass index to block as well
			yield self_array[i], i
		end
		self
	end
	
	# my_select = select
	def my_select
		# Return enumerator if no block given
		return self.enum_for(:my_select) unless block_given?
		# Returns a Hash if self is a Hash
		if self.is_a? Hash
			selected = {}
			# Go through each of the elements:
			self.my_each do |key, value|
				# Add to hash if block returns true
				selected[key] = value if yield(key, value)
			end
		# Otherwise, make an array
		else
			selected = []
			# Go through each of the elements:
			self.my_each do |element|
				# If the block returns true, append element to the array
				selected.push(element) if yield(element)
			end
		end
		# Return the selected elements
		selected
	end
end

