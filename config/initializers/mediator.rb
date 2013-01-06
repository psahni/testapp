class Mediator

  # Public: Railtie for initializing the BrowserDetails middleware and making
  # the browser_details.js file available.
  #
  class Railtie < Rails::Railtie
    initializer "browser_details.insert_middleware" do |app|
      app.config.middleware.use Mediator
    end

   
  end

end
