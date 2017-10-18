class Message < ActiveRecord::Base

  validates :content, presence: true, length: { in: 10..255 }
  validates :user, :event, presence: true
  
  belongs_to :user
  belongs_to :event
end
