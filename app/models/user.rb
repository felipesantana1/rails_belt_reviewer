class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true, length: { in: 5..25 }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..30 }
  validates :location, presence: true, length: { in: 3..30 }
  validates :state, presence: true, length: { in: 2..2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, on: :create

  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :joined_events, through: :joins, source: :event
  has_many :joins, dependent: :destroy

  has_secure_password
end
