# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cordel_session',
  :secret      => 'f3b9975f346d9e4fc43ceadf3eef01b06a9eddf153424035c7a1559b2a30dc968b054a6d171e365732d4ed73fa71454e055f464a92f0433f45a863506c6c0803'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
