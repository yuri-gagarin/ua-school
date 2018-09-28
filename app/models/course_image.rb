class CourseImage < ApplicationRecord
    mount_uploader :image, CourseImageUploader
    belongs_to :course
end
