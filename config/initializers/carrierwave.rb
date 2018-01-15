require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],                     # required
    :region                 => 'eu-central-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'wassaly'                             # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
