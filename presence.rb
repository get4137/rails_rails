# frozen_string_literal: true
#
# Topic: `presence` (ActiveSupport)
# Purpose: Return the object if present, otherwise nil.
# Environment: Rails only (ActiveSupport). Not available in plain Ruby.
#
# Example 1: Strings
if "".respond_to?(:presence)
  puts "Example 1: #{"".presence.inspect}"
  puts "Example 1: #{"ruby".presence.inspect}"
else
  puts "Example 1: presence requires ActiveSupport"
end

# Example 2: Arrays
if [].respond_to?(:presence)
  puts "Example 2: #{[].presence.inspect}"
  puts "Example 2: #{[1].presence.inspect}"
end

# Example 3: Use with fallback
if "".respond_to?(:presence)
  name = "".presence || "Guest"
  puts "Example 3: #{name}"
end

# Example 4: Manual alternative (plain Ruby)
value = ""
manual = value.nil? || value.to_s.strip.empty? ? nil : value
puts "Example 4: #{manual.inspect}"
