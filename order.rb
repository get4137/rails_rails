# frozen_string_literal: true
#
# Topic: ActiveRecord `order`
# Purpose: Show common ordering patterns and pitfalls in queries.
# Environment: Rails only (ActiveRecord). Not available in plain Ruby.
#
# Example 1: Ascending order (default)
users = User.order(:created_at)
# SQL: ORDER BY "users"."created_at" ASC

# Example 2: Descending order
users = User.order(created_at: :desc)

# Example 3: Multiple columns
users = User.order(:last_name, :first_name)

# Example 4: Mixed directions
users = User.order(last_name: :asc, created_at: :desc)

# Example 5: Raw SQL fragment
users = User.order("LOWER(email) ASC")

# Example 6: NULLS LAST (PostgreSQL)
users = User.order("created_at DESC NULLS LAST")

# Example 7: Chaining with where/limit/offset
users = User.where(active: true).order(:created_at).limit(10).offset(20)

# Example 8: `reorder` overrides previous order
users = User.order(:name).reorder(:created_at)

# Example 9: Remove ordering
users = User.order(:name).unscope(:order)

# Example 10: Joined table ordering
users = User.joins(:posts).order("posts.created_at DESC")

# Example 11: Lazy evaluation
relation = User.order(:created_at)
puts "Example 11: #{relation.class}" # ActiveRecord::Relation

# Example 12: Dynamic direction with safety
allowed = %w[asc desc]
direction = allowed.include?(params[:direction]) ? params[:direction] : "asc"
users = User.order("created_at #{direction}")

# Example 13: Common mistake (sorting in Ruby)
# Bad: loads all rows then sorts in memory
# users = User.all.to_a.sort_by(&:created_at)
# Good: let the database order results
users = User.order(:created_at)
