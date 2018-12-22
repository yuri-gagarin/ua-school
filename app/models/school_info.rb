class SchoolInfo < ApplicationRecord
    has_many :school_info_images, dependent: :destroy
    accepts_nested_attributes_for :school_info_images, allow_destroy: true 

    enum page_type: [:building, :finance, :organization, :history]

    before_validation :generate_slug

    validates :title, presence: true 
    validates :description, presence: true
    validates :slug, uniqueness: true, presence: true, exclusion: {in: %w[signup login]}
    validates :page_type, uniqueness: true

    def to_param
        slug # or "#{id}-#{page_type}".parameterize
    end
      
    def generate_slug
        self.slug ||= self.page_type.to_s.parameterize
    end

end
