
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIAJTKNKQHOSESEBRPA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['kanegon-teddy-app']
  end
end

