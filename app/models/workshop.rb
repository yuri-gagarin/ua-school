class Workshop < ApplicationRecord
    has_many :workshop_images, dependent: :destroy
    accepts_nested_attributes_for :workshop_images, allow_destroy: true

    validates :name, length: {minimum: 1}, presence: true
    validates :details, length: {minimum: 1}, presence: true
    validates :description , length: {minimum: 1}, presence: true

end
