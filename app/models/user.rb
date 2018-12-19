class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_one :user_image, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :courses, dependent: :destroy

  enum role: [:member, :student, :teacher, :admin]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def full_name 
    "#{self.name}  #{self.last_name}"
  end


  self.per_page = 3

end
