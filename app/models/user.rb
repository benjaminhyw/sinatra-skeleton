class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  validates_presence_of :first_name, :last_name, :email, :password
  validates :email, uniqueness: true
  validates :hashed_password, uniqueness: true

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      return @user
    else
      nil
    end
  end

end
