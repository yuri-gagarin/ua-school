class Course < ApplicationRecord
    belongs_to :user

    has_many :course_attachments
    accepts_nested_attributes_for :course_attachments

    validates :name, length: {minimum: 1}, presence: true
    validates :description, length: {minimum: 1}, presence: true

end
