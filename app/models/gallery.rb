class Gallery < ApplicationRecord

    has_many :gallery_images, dependent: :destroy
    accepts_nested_attributes_for :gallery_images, allow_destroy: true 

    validates :title, length: {minimum: 1}, presence: true
    validates :description, length: {minimum: 1}, presence: true

end
