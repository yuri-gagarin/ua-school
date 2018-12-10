class IndexPostImage < ApplicationRecord
    mount_uploader :image, IndexPostImageUploader
    belongs_to :index_post
end
