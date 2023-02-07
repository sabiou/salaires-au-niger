class Salary < ApplicationRecord
  validates :title, presence: true
  validates :city, presence: true
  validates :seniority, presence: true
  validates :salary, presence: true, numericality: {greater_than: 0}
end
