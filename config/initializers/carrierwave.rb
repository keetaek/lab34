CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJDBLQU3CE5PIKLNA',       # required
    :aws_secret_access_key  => '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',       # required
    #:region                 => 'us-west-1'  # optional, defaults to 'us-east-1'
  }
  #TODO: the bucket name should be modified to be compliant with DNS rule. 
  #Get rid of underscore and replace with dots.
  config.fog_directory  = 'lab34.pictures'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

