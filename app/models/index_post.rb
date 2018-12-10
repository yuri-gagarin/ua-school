class IndexPost < ApplicationRecord
    has_many :index_post_images, dependent: :destroy
    validates :title, presence: true
    validates :description, presence: true
    validates_uniqueness_of :page_type
    enum page_type: [:education, :teachers, :workshops, :school, :about]
end
