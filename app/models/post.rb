class Post
  include Mongoid::Document
  # relationships
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :shots, dependent: :destroy
  # accepts_nested_attributes_for :shots, allow_destroy: true

  field :title, type: String
  field :body, type: String
  field :timestamp, type: Time

  validates :title, presence: true
end
