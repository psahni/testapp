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


##############################################COMMENTS###################################################

# => If you want to route /admin/posts to PostsController (without the Admin:: module prefix), you could use
#scope "/admin" do
#  resources :posts, :comments
#end
# => match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# => resources :posts, :path => "/admin/posts" $ FOR A SINGLE CASE

#########################################################################################################
