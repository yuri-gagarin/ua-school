class UserImage < ApplicationRecord
    mount_uploader :image, UserAvatarUploader
    belongs_to :user
end
