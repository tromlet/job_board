class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :jobs
  has_many :applicants
  has_many :prospects, through: :applicants, source: :jobs
  has_one_attached :resume

  # Grabs the standard, small Gravatar for use as an avatar
  def smol_avatar_url
    # Gravatar uses MD5 hashes of people's email addresses, so it works well here.
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?size=50px"
  end

  # Grabs the big Gravatar for use as an avatar!
  def big_avatar_url
    # Gravatar uses MD5 hashes of people's email addresses, so it works well here.
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?size=800px"
  end
end
