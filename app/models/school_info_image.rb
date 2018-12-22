class SchoolInfoImage < ApplicationRecord
    mount_uploader :image, SchoolInfoImagesUploader
    belongs_to :school_info
end
