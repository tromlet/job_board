class Job < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }

  scope :search, -> search {where("jobs.title LIKE '%#{search}%' OR jobs.description LIKE '%#{search}%'")}

  belongs_to :user
  has_many :applicants
  has_many :candidates, through: :applicants, source: :user
end
