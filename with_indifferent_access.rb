# frozen_string_literal: true
#
# Topic: `with_indifferent_access` (ActiveSupport)
# Purpose: Allow hash keys to be accessed by symbols or strings interchangeably.
# Environment: Rails only (ActiveSupport). Not available in plain Ruby.
#
# Example 1: Plain Ruby hash is strict about key types
plain = { "name" => "Alice" }
puts "Example 1: string=#{plain["name"].inspect}, symbol=#{plain[:name].inspect}"

# Example 2: ActiveSupport hash with indifferent access
if {}.respond_to?(:with_indifferent_access)
  data = { "name" => "Alice", age: 30 }.with_indifferent_access
  puts "Example 2: string=#{data["name"].inspect}, symbol=#{data[:name].inspect}"
else
  puts "Example 2: Hash#with_indifferent_access requires ActiveSupport"
end

# Example 3: Assigning with either key type
if {}.respond_to?(:with_indifferent_access)
  data = {}.with_indifferent_access
  data[:role] = "admin"
  puts "Example 3: string=#{data["role"].inspect}, symbol=#{data[:role].inspect}"
end

# Example 4: Nested hashes are converted (ActiveSupport)
if {}.respond_to?(:with_indifferent_access)
  nested = { user: { "email" => "a@example.com" } }.with_indifferent_access
  puts "Example 4: #{nested[:user][:email]}"
end

# Example 5: Be careful with conflicting keys
if {}.respond_to?(:with_indifferent_access)
  data = { "id" => 1, id: 2 }.with_indifferent_access
  puts "Example 5: id=#{data[:id]}"
end
