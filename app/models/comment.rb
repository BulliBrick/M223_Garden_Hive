class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :comment_content, presence: true, length: { minimum: 10, maximum: 1000 }
end