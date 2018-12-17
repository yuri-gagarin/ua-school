class GradeImage < ApplicationRecord
    mount_uploader :image, GradeImageUploader
    belongs_to :grade
end
