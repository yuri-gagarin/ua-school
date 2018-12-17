class Grade < ApplicationRecord

    has_many :courses, dependent: :destroy
    has_many :grade_images, dependent: :destroy
    accepts_nested_attributes_for :grade_images, allow_destroy: true

    validates :level, uniqueness: true, presence: true 
    validates :description, presence: true 
    
end

