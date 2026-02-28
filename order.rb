# frozen_string_literal: true
#
# Topic: ActiveRecord `order`
# Purpose: Show common ordering patterns and pitfalls in queries.
# Environment: Rails only (ActiveRecord). Not available in plain Ruby.
#
# Example 1: Ascending order (default)
# output: ActiveRecord::Relation ordered by created_at ascending
users = User.order(:created_at)
# SQL: ORDER BY "users"."created_at" ASC

# Example 2: Descending order
# output: ActiveRecord::Relation ordered by created_at descending
users = User.order(created_at: :desc)

# Example 3: Multiple columns
# output: ActiveRecord::Relation ordered by last_name ASC, then first_name ASC
users = User.order(:last_name, :first_name)

# Example 4: Mixed directions
# output: ActiveRecord::Relation ordered by last_name ASC, then created_at DESC
users = User.order(last_name: :asc, created_at: :desc)

# Example 5: Raw SQL fragment
# output: ActiveRecord::Relation ordered by lowercased email ascending
users = User.order("LOWER(email) ASC")

# Example 6: NULLS LAST (PostgreSQL)
# output: ActiveRecord::Relation ordered by created_at DESC with NULL values last
users = User.order("created_at DESC NULLS LAST")

# Example 7: Chaining with where/limit/offset
# output: ActiveRecord::Relation filtered to active users, ordered by created_at, limited and offset
users = User.where(active: true).order(:created_at).limit(10).offset(20)

# Example 8: `reorder` overrides previous order
# output: ActiveRecord::Relation ordered only by created_at (name ordering removed)
users = User.order(:name).reorder(:created_at)

# Example 9: Remove ordering
# output: ActiveRecord::Relation with ORDER BY removed
users = User.order(:name).unscope(:order)

# Example 10: Joined table ordering
# output: ActiveRecord::Relation joined with posts and ordered by posts.created_at DESC
users = User.joins(:posts).order("posts.created_at DESC")

# Example 11: Lazy evaluation
# output: Example 11: ActiveRecord::Relation
relation = User.order(:created_at)
puts "Example 11: #{relation.class}" # ActiveRecord::Relation

# Example 12: Dynamic direction with safety
# output: ActiveRecord::Relation ordered by created_at using only "asc" or "desc"
allowed = %w[asc desc]
direction = allowed.include?(params[:direction]) ? params[:direction] : "asc"
users = User.order("created_at #{direction}")

# Example 13: Common mistake (sorting in Ruby)
# output: ActiveRecord::Relation ordered in SQL (preferred over in-memory sort)
# Bad: loads all rows then sorts in memory
# users = User.all.to_a.sort_by(&:created_at)
# Good: let the database order results
users = User.order(:created_at)
