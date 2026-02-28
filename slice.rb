# frozen_string_literal: true
#
# Topic: `slice`
# Purpose: Select specific keys from a hash or a substring from a string.
# Environment: Mixed. Array/String `slice` are Ruby core; Hash `slice` is ActiveSupport (Rails).
#
# Example 1: Hash slice (ActiveSupport)
# output (ActiveSupport): Example 1: {:id=>1, :email=>"a@example.com"}
# output (without ActiveSupport): Example 1: Hash#slice requires ActiveSupport
if {}.respond_to?(:slice)
  params = { id: 1, email: "a@example.com", role: "admin" }
  puts "Example 1: #{params.slice(:id, :email).inspect}"
else
  puts "Example 1: Hash#slice requires ActiveSupport"
end

# Example 2: Plain Ruby alternative for hash slice
# output: Example 2: {:id=>1, :email=>"a@example.com"}
params = { id: 1, email: "a@example.com", role: "admin" }
keys = [:id, :email]
selected = params.select { |k, _| keys.include?(k) }
puts "Example 2: #{selected.inspect}"

# Example 3: Array slice by index
# output: Example 3: ["b", "c"]
array = ["a", "b", "c", "d"]
puts "Example 3: #{array.slice(1, 2).inspect}"

# Example 4: String slice by range
# output: Example 4: "ub"
text = "ruby"
puts "Example 4: #{text.slice(1..2).inspect}"

# Example 5: String slice by regex
# output: Example 5: "hello@example.com"
text = "hello@example.com"
puts "Example 5: #{text.slice(/\w+@\w+\.com/).inspect}"
