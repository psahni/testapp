class ApplicationController < ActionController::Base
  protect_from_forgery

  class NotFound < StandardError; end

  #rescue_from Exception, :with => :handle_public_exception

  def handle_public_exception(exception)
    render :template => 'testing/error_page.html'
  end

  helper_method :awesome_log

  def awesome_log(string, mode = :info)
    Rails.logger.send(mode, "[AWESOME LOG] [ #{ mode }]: " + string)
  end

end
