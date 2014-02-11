class Image
  include Mongoid::Document
  extend Dragonfly::Model

  dragonfly_accessor :image

  belongs_to :post
  field :image_uid, type: String
  field :image_name, type: String
end
