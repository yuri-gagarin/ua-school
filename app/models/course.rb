class Course < ApplicationRecord
    belongs_to :user

    has_many :course_images, dependent: :destroy
    accepts_nested_attributes_for :course_images, allow_destroy: true 

    validates :name, length: {minimum: 1}, presence: true
    validates :description, length: {minimum: 1}, presence: true

end
