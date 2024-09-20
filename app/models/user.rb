class User < ApplicationRecord
  belongs_to :user_role
  has_many :articles
  has_many :comments
  has_many :article_approvals

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  delegate :can_approve_articles?, to: :user_role

  private

  def password_required?
    new_record? || password.present?
  end
end