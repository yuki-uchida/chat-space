require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'uploat-test'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/uploat-test'
    when 'production'
        config.fog_directory  = 'uploat-test'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/uploat-test'
    end
end
