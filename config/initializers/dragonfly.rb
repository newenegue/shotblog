require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "5c0b23745c6192bbfb3b5e3f356631c7393303cd94a4541517f6749ef81fad7f"

  url_format "/media/:job/:name"

  # datastore :file,
  #   root_path: Rails.root.join('public/system/dragonfly', Rails.env),
  #   server_root: Rails.root.join('public')

  datastore :s3,
    bucket_name: 'shotblog',
    access_key_id: ENV['AWSAccessKeyId'],
    secret_access_key: ENV['AWSSecretKey']
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
