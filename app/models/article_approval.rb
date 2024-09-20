class ArticleApproval < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :status, presence: true, inclusion: { in: %w(approved rejected pending) }
  validates :article_id, uniqueness: { scope: :user_id, message: "has already been reviewed by this user" }
  validate :user_can_approve_articles

  private

  def user_can_approve_articles
    unless user.can_approve_articles?
      errors.add(:user, "does not have permission to approve articles")
    end
  end
end