class VisitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :review, :journal, :images, :code, :score, :user_id, :username, :created_at
  # belongs_to :user
  
  # :id, :score, :review, :username, :created_at

  def images
    images = []
    return unless object.images.attachments
    image_urls = object.images.map do |image| 
      # rails_blob_url(image)
      image = { url: rails_blob_url(image), signed_id: image.signed_id }
      images << image
    end
  
    images
  end

  

end
