class Mapping < ApplicationRecord
  has_many :questions
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
