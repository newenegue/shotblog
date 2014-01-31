class Post
  include Mongoid::Document
  belongs_to :user
  embeds_many :comments
  field :title, type: String
  field :body, type: String
end
