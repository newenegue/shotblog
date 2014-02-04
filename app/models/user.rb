class User
  include Mongoid::Document
  has_many :posts, dependent: :destroy
  field :username, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :blog_name, type: String

  validates :username, presence: true, uniqueness: true
  validates :first_name, length: {maximum: 30}
  validates :last_name, length: {maximum: 30}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :blog_name, presence: true, uniqueness: true
end
