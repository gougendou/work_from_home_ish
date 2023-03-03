class Review < ApplicationRecord
  belongs_to :workspace
  validates :content, length: { minimum: 20 }
end
