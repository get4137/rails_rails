# frozen_string_literal: true
#
# Topic: `compact_blank` (ActiveSupport)
# Purpose: Remove blank values (nil, empty, whitespace) from arrays and hashes.
# Environment: Rails only (ActiveSupport). Not available in plain Ruby.
#
# Example 1: Array compact_blank
if [].respond_to?(:compact_blank)
  values = [nil, "", "  ", "a", "b"]
  puts "Example 1: #{values.compact_blank.inspect}"
else
  puts "Example 1: compact_blank requires ActiveSupport"
end

# Example 2: Hash compact_blank
if {}.respond_to?(:compact_blank)
  data = { a: nil, b: "", c: "ok", d: "  " }
  puts "Example 2: #{data.compact_blank.inspect}"
end

# Example 3: Difference from `compact`
values = [nil, "", "a"]
puts "Example 3: compact=#{values.compact.inspect}"
if [].respond_to?(:compact_blank)
  puts "Example 3: compact_blank=#{values.compact_blank.inspect}"
end

# Example 4: Mutating version `compact_blank!`
if [].respond_to?(:compact_blank!)
  values = [nil, "", "a"]
  values.compact_blank!
  puts "Example 4: #{values.inspect}"
end

# Example 5: Manual alternative (plain Ruby)
values = [nil, "", "  ", "a"]
manual = values.reject { |v| v.nil? || v.to_s.strip.empty? }
puts "Example 5: #{manual.inspect}"
