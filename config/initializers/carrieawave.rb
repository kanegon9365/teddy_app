
if Rails.env == 'production'
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
  config.fog_credentials = {
   provider: 'AWS',
   aws_access_key_id: ENV['AKIAJTV7MCKSST6V65OQ'],
   aws_secret_access_key: ENV['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'],
   region: 'ap-northeast-1'
   }
  config.fog_directory = 'kanegon-teddy-app'
   config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/kanegon-teddy-app'
  end
end