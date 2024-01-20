# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

	def test_push!
		stack = Stack.new([1])
		expected = [1, 2]
		assert(stack.push!(2) == expected)
	end

	def test_pop!
		stack = Stack.new([1, 2, 3])
		expected = [1, 2]
		stack.pop!
		assert(stack.to_a == expected)
	end

	def test_clear!
		stack = Stack.new([1, 2])
		expected_size = 0
		stack.clear!
		assert(stack.size == 0)
	end
	
	def test_empty?
	 	stack = Stack.new([])
		assert(stack.empty? == true)
	end

	
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
