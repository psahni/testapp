TestingApp::Application.configure do

  # Settings specified here will take precedence over those in config/application.rb
  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.

  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true


  #############################################################################

  # Caching

  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)

  config.serve_static_assets = true
  config.assets.digest = true
  config.static_cache_control = "public, max-age=2592000"

  #############################################################################

  # Read Cache Digest Gem Read Me
  config.action_view.cache_template_loading = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  #--------------------------------------------------------
  # RACK CACHE CONFIGURATION
  #--------------------------------------------------------

  client = Dalli::Client.new
  config.action_dispatch.rack_cache = {
      :metastore    => client,
      :entitystore  => client,
      :allow_reload => false
  }
end
