CarrierWave.configure do |config|
 
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJQH5RXF2VBG6I77Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
   
  }
  config.fog_directory  = 'gameschool'                          # required
end