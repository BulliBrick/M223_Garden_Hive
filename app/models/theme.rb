class Theme < ApplicationRecord
    has_many :articles
  
    validates :theme_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  end