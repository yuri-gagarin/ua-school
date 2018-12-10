class WorkshopImage < ApplicationRecord

    mount_uploader :image, WorkshopImageUploader
    belongs_to :workshop 

end
