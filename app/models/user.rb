class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :jobs

  def avatar_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/#{hash}"
  end
end
