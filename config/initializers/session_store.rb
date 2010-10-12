# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rps_game_session',
  :secret      => '0b358ef7760945854244eff7faa3fecba34d5a23b860bcd08a2f961a2db00605eccfbe0f337e45eb3e6e5e7ded5b40c51cc4916054fa15684bc4ad17650bb5ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
