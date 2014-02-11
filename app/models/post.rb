class Post
  include Mongoid::Document

  extend Dragonfly::Model
  dragonfly_accessor :image

  # relationships
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy

  field :title, type: String
  field :body, type: String
  field :timestamp, type: Time
  field :image_uid, type: String
  field :image_name, type: String

  validates :title, presence: true

  # validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
end
