class VisitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :review, :journal, :images, :code, :score, :user_id
 

  def images
    return unless object.images.attachments
    image_urls = object.images.map do |image| 
      rails_blob_path(image)
    end
  
    image_urls
  end


end
