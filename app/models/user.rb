class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, length: { in: 6..20}

  has_many :todos
end
