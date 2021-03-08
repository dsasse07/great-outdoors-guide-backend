class Visit < ApplicationRecord
    belongs_to :user
    has_many_attached :images, dependent: :destroy
    # has_one_attached :images
    # validates :code, uniqueness: true

    def username 
        User.find_by(id: self.user_id).username
    end

end
