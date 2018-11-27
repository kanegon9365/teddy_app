# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# if Rails.env.production?
#   config.storage :fog
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: 'AKIAJ75WZPBHP7OPNSEA',
#       aws_secret_access_key: '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',
#       region: 'ap-northeast-1'
#     }
  
#     config.fog_directory  = 'rails-photo-123'
#     config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/kanegon-teddy-app"
#     config.cache_storage = :fog
#   end
# end

