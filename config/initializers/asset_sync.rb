if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = 'binofparts'
    # These can be found under Access Keys in AWS Security Credentials
    config.aws_access_key_id = 'AKIAJSACDCCHSPXQZZZA'
    config.aws_secret_access_key = 'rBcb1BGi+KaiAaUkGLP1Ffp8BogmcnxKtY0gPCGf'

    # Don't delete files from the store
    config.existing_remote_files = 'keep'

    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = true
  end
end
