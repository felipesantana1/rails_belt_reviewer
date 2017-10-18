class Event < ActiveRecord::Base

  validates :name, presence: true, length: { in: 2..50 }
  validates :location, presence: true, length: { in: 4..25 }
  validates :state, presence: true, length: { in: 2..2 }
  validates :date, inclusion: { in: (Date.today..Date.today+20.years), message: "must be in the future!"}

  has_many :users
  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user
  has_many :messages, dependent: :destroy
  belongs_to :user
end
