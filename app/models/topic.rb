class Topic < ApplicationRecord
  belongs_to :user

  has_many :topic_images, dependent: :destroy
  accepts_nested_attributes_for :topic_images, allow_destroy: true

  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 15}, presence: true
  validates :user_id, presence: true

  

end
