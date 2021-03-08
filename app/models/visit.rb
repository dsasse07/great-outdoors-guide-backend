class Visit < ApplicationRecord
    # has_many_attached :images, dependent: :destroy
    has_one_attached :images
    # validates :code, uniqueness: true

end
