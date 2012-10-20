TestingApp::Application.routes.draw do

  root :to => 'testing#index'
  
  resources :testing do
   collection do
    get 'test' 
    get 'embed'
   end
  end

  resources :snippets 
  
  mount Resque::Server, :at => "/resque"
    
  # PATH PREFIX
  # config/routes.rb
  
  scope "/:locale" do
    resources :books
  end

end
