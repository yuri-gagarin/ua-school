class Course < ApplicationRecord
    mount_uploaders :images, ImageUploader
    belongs_to :user

    validates :name, length: {minimum: 1}, presence: true
    validates :description, length: {minimum: 1}, presence: true

end
