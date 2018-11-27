if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws' 
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIAJ75WZPBHP7OPNSEA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['kanegon-teddy-app']
  end
end