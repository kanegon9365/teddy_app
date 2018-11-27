# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# if Rails.env.production?
#   config.storage :fog
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: 'AKIAJTKNKQHOSESEBRPA',
#       aws_secret_access_key: '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',
#       region: 'ap-northeast-1'
#     }
  
#     config.fog_directory  = 'rails-photo-123'
#     config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/kanegon-teddy-app"
#     config.cache_storage = :fog
#   end
# end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    
  end
end

