class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :destroy
  has_many :article_approvals
  has_many :approvers, through: :article_approvals, source: :user

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 100 }

  scope :approved, -> { joins(:article_approvals).where(article_approvals: { status: 'approved' }).distinct }
  scope :pending_approval, -> { left_outer_joins(:article_approvals).where(article_approvals: { id: nil }).or(Article.where.not(article_approvals: { status: 'approved' })).distinct }

  def approve(approver)
    if approver.can_approve_articles?
      article_approvals.create(user: approver, status: 'approved')
    else
      errors.add(:base, "User does not have permission to approve articles")
      false
    end
  end
end