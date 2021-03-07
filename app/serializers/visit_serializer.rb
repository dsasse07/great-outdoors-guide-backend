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

  def images
    byebug
    return unless object.images.attachments
    image_urls = object.images.map do |image| 
      URI.join(
        ActionController::Base.asset_host, 
        rails_blob_path(image))
    end
  
    image_urls
  end

end
