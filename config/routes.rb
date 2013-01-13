TestingApp::Application.routes.draw do


  root :to => 'testing#index'

  
  resources :testing do
   collection do
    get 'test' 
    get 'embed'
    get 'fbtesting'
   end
  end
  
  match '/fbtesting' => "testing#fbtesting", :as => :testing
  
  
  resources :messages
  resources :snippets 
  
  mount Resque::Server, :at => "/resque"
    
  # PATH PREFIX
  # config/routes.rb
  
  scope "/:locale" do
    resources :books
  end

end

# match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
