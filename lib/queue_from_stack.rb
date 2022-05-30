require_relative './stack'

# your code here
# Start by creating the MyQueue class, and set it up to initialize two new, empty instances of the Stack class; in order for the tests to pass, you will need to name these @s1 and @s2. You should not initialize an empty array for your MyQueue instance.
class MyQueue
    def initialize
        @s1 = Stack.new
        @s2 = Stack.new
    end

    # MyQueue#add(value): adds an element to the end of the Queue:
    # We use two stacks so that we can re-order the items when adding a new item, 
    # and move the added item to the bottom of the stack
    def add(value)
    # If we start with the following values before calling `#add(3)`
    # @s1: [2, 1]    @s2: []
    # First, take all the items out of @s1 and move them to @s2: 
    # @s1: []        @s2: [1, 2]
    @s2.push(@s1.pop) until @s1.empty? 
    # Next, add a new item to the now-empty @s1: 
    # @s1: [3]       @s2: [1, 2]
    @s1.push(value)
    # Finally, return all items to @s1 in the order they were removed: 
    # @s1: [3, 2, 1] @s2: []
    @s1.push(@s2.pop) until @s2.empty? 
    end

    # MyQueue#remove: removes and returns the first element in the Queue
    def remove
        @s1.pop
    end

    # MyQueue#peek: returns the first element in the Queue without removing it
    def peek
        @s1.peek
    end
end