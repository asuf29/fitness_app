class Like < ApplicationRecord
  belong_to :user
  belong_to :comment

  validates :user_id, uniqueness: { scope: :comment_id, message: "You can only like a comment once." }
end
