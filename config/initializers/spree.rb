# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
end

Spree.user_class = "Spree::User"

SpreeMarketplace::Config[:stripe_publishable_key] = 'pk_test_M6sxwuVwqf72nfRslinpW0L1'
SpreeMarketplace::Config[:stripe_secret_key] = 'sk_test_3aTDSBROCbDYHnABPTlwokA4'