class Visit < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    # validates :code, uniqueness: true

end
