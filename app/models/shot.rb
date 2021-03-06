class Shot
  include Mongoid::Document
  extend Dragonfly::Model
  include Rails.application.routes.url_helpers

  dragonfly_accessor :image

  belongs_to :post
  field :image_uid, type: String
  field :image_name, type: String

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image_name),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb('80x80#').url,
      "delete_url" => shot_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
