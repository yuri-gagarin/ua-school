class GalleryImage < ApplicationRecord
    mount_uploader :image, GalleryImageUploader
    belongs_to :gallery
end
