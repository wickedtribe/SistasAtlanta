# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sistasatlanta_session',
  :secret      => 'c9d7841b6d33e2c482dcb2f837bd0cc887613fa64803a6185e06019019956112696d8b1379731453b301cc688d51c719aca67b6d5b50b81fdc29003801469ab4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
