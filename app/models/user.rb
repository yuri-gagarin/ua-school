class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :courses, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 100}, presence: true
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  validates :password, length: {minimum: 6}, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 254}

  enum role: [:member, :student, :teacher, :admin]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end
end
