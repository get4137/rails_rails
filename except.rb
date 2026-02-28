# frozen_string_literal: true
#
# Topic: Hash#except (ActiveSupport) and plain Ruby alternatives
# Purpose: Remove keys from a hash without mutating the original.
# Environment: Rails extension (ActiveSupport) with plain Ruby alternatives in this file.
# Note: `except` requires ActiveSupport (Rails). Plain Ruby alternatives are shown below.
#
# Example 1: Plain Ruby with `reject`
# output: Example 1: {:id=>1, :email=>"a@example.com"}
params = { id: 1, email: "a@example.com", password: "secret" }
filtered = params.reject { |key, _| key == :password }
puts "Example 1: #{filtered.inspect}"

# Example 2: Plain Ruby helper
# output: Example 2: {:email=>"a@example.com"}
class Hash
  def except_keys(*keys)
    reject { |key, _| keys.include?(key) }
  end
end

puts "Example 2: #{params.except_keys(:id, :password).inspect}"

# Example 3: Mutating with `delete`
# output: Example 3: {:id=>1, :email=>"a@example.com"}
params_copy = params.dup
params_copy.delete(:password)
puts "Example 3: #{params_copy.inspect}"

# Example 4: ActiveSupport `except` if available
# output (ActiveSupport): Example 4: {:id=>1, :email=>"a@example.com"}
# output (without ActiveSupport): Example 4: Hash#except is not available without ActiveSupport
if {}.respond_to?(:except)
  puts "Example 4: #{params.except(:password).inspect}"
else
  puts "Example 4: Hash#except is not available without ActiveSupport"
end
