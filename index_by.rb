# frozen_string_literal: true
#
# Topic: Indexing collections by a key
# Purpose: Build a hash from an array keyed by a block.
# Environment: Ruby core patterns. Rails has `index_by`; this file also shows a plain Ruby implementation.
#
# Example 1: Index by `id`
users = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" }
]
indexed = users.each_with_object({}) { |user, acc| acc[user[:id]] = user }
puts "Example 1: #{indexed.inspect}"

# Example 2: Index by computed key
words = %w[alpha beta gamma]
by_length = words.each_with_object({}) { |word, acc| acc[word.length] = word }
puts "Example 2: #{by_length.inspect}"

# Example 3: Duplicate keys overwrite earlier values
items = %w[ant art arc]
by_first_letter = items.each_with_object({}) { |word, acc| acc[word[0]] = word }
puts "Example 3: #{by_first_letter.inspect}"

# Example 4: Index by a method
class User
  attr_reader :email

  def initialize(email)
    @email = email
  end
end

users = [User.new("a@example.com"), User.new("b@example.com")]
by_email = users.each_with_object({}) { |user, acc| acc[user.email] = user }
puts "Example 4: #{by_email.keys.inspect}"

# Example 5: Rails-like `index_by` helper (simple implementation)
module Enumerable
  def index_by
    each_with_object({}) { |item, acc| acc[yield(item)] = item }
  end
end

puts "Example 5: #{words.index_by(&:length).inspect}"
