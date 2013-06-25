if Rails.env.development?
  Rails.logger.info "Dowloading Assets:"
  Rails.application.assets.logger = Logger.new('/dev/null')
  Rails::Rack::Logger.class_eval do
    def call_with_quiet_assets(env)
      #Rails.logger.info env['PATH_INFO'].inspect
      previous_level = Rails.logger.level
      Rails.logger.level = Logger::ERROR if env['PATH_INFO'].match(/^\/assets/) #=~ %r{^"/assets/}
      call_without_quiet_assets(env)
    ensure
      Rails.logger.level = previous_level
    end
    alias_method_chain :call, :quiet_assets
  end
end

#-------------------------------------------------------------------------
# ISSUE DISSCUSSED HERE
# https://github.com/rails/rails/issues/2639
#-------------------------------------------------------------------------
