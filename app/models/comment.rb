class Comment
  include Mongoid::Document
  belongs_to :post
  belongs_to :user
  # field :commenter, type: String
  field :body, type: String
  field :timestamp, type: Time
  validates :body, presence: true

  before_create :set_timestamp

  def set_timestamp
  	self.timestamp = Time.now
  end
end
