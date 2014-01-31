class User
  include Mongoid::Document
  has_many :posts
  field :user_name, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :blog_name, type: String
end
