class TopicImage < ApplicationRecord
    mount_uploader :image, TopicImageUploader
    belongs_to :topic
end
