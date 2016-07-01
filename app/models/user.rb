class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, length: { in: 6..40}

  has_many :todos, :dependent => :destroy


  def self.authenticate(username, password)
    return false if username.empty? or password.empty?
    user = self.find_by(:username => username)
    return false if user.blank?
    if not encrypt_password(password) == user.password
      return false
    else
      return user
    end
  end


  def self.encrypt_password(pwd)
    Digest::SHA1.hexdigest(pwd.to_s)
  end

end