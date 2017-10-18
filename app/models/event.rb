class Event < ActiveRecord::Base

  validates :name, presence: true, length: { in: 2..50 }
  validates :location, presence: true, length: { in: 4..25 }
  validates :state, presence: true, length: { in: 2..2 }
  validates_each :date do |record, attr, value|
    record.errors.add(attr, "must be in the future") if value < Date.today
  end

  has_many :users
  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user
  has_many :messages, dependent: :destroy
  belongs_to :user
end
