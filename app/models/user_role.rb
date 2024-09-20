class UserRole < ApplicationRecord
    has_many :users
  
    validates :role_name, presence: true, uniqueness: true
  
    def can_approve_articles?
      ['moderator', 'admin'].include?(role_name)
    end
  end