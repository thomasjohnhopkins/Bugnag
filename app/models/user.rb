class User < ApplicationRecord
  attr_reader :password

  after_initialize :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :bugs

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    # using the ||= operator instead of ||, ensures that we
    # end up with a new session token every time we create
    # a new instance of the User class.
    self.session_token ||= self.class.generate_session_token
  end

end
