class VisitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :review, :journal, :images, :code, :score, :user_id
  
  # def images
  #   byebug
  #   if object.images.attached?
  #     images.map
  #     {
  #       |image| url: rails_blob_url(object.image)
  #     }
  #   end
  # end

  # def images
  #   byebug
  #   return unless object.images.attachments
  #   image_urls = object.images.map do |image| 
  #     URI.join(
  #       ActionController::Base.asset_host, 
  #       rails_blob_path(image))
  #   end
  
  #   image_urls
  # end

  def images
    Rails.application.routes.default_url_options[:port] = 3000
    Rails.application.routes.default_url_options[:host] = 'localhost'
    if object.images.attached?
      {
        url: rails_blob_url(object.images)
      }
    end
  end

end
