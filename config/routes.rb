TestingApp::Application.routes.draw do


  root :to => 'testing#index'

  
  resources :testing, :controller => :testing do
   collection do
    get 'test' 
    get 'embed'
    get 'fbtesting'
    get 'handlerbar'
    match 'upload_image', :via => [:post, :put, :get]
   end
  end
  
  match '/fbtesting' => "testing#fbtesting",   :as => :testing
  match '/handlebar' => 'testing#handlebar',   :as => :handlebar1
  match '/responsive' => 'testing#responsive', :as => :responsive
  match '/download' => 'testing#download_file', :as => :download
  
  resources :messages
  resources :snippets 
  resources :teachers
  resources :uploader, :controller => 'uploader' do
    collection do
     get 'html5_uploader'
    end
  end

  resources :articles do
    resources :comments
  end
  mount Resque::Server, :at => "/resque"


  # PATH PREFIX
  # config/routes.rb
  
  scope "/:locale" do
    resources :books
  end

	##
	## CAN API TESTING
	##
	get '/merchants', :to => 'testing#merchants'
	get '/merchants/:id/docs', :to => 'testing#merchants'
  get '/merchants/:id',      :to => 'testing#retrieve_merchants'
end


##############################################COMMENTS###################################################

# => If you want to route /admin/posts to PostsController (without the Admin:: module prefix), you could use
#scope "/admin" do
#  resources :posts, :comments
#end
# => match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# => resources :posts, :path => "/admin/posts" $ FOR A SINGLE CASE

#########################################################################################################
