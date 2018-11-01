class Transaction < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :debit, presence: true,
  numericality: {greater_than_or_equal_to: 0}
  validates :credit, presence: true,
  numericality: {greater_than_or_equal_to: 0}
  validates :source, presence: true,
  length: {minimum: 1}
  default_scope -> {
    order(created_at: :desc)
  }
end
