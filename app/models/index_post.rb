class IndexPost < ApplicationRecord
    has_many :index_post_images, dependent: :destroy

    accepts_nested_attributes_for :index_post_images, allow_destroy: true 
    enum page_type: [:class_schedule, :workshop_schedule, :all_classes, :preschool, :baby_group, 
                     :cost, :about_classes, :about_teachers, :about_us]
    before_validation :generate_slug


    validates :title, presence: true
    validates :description, presence: true
    validates :slug, uniqueness: true, presence: true, exclusion: {in: %w[signup login]}
    validates_uniqueness_of :page_type

    def to_param
        slug # or "#{id}-#{page_type}".parameterize
    end
      
    def generate_slug
        self.slug ||= page_type.parameterize
    end

    

end
