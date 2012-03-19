namespace :db do

  desc 'Bootstrap data'

  task :bootstrap => :environment  do

    User.delete_all
    
    puts "=> Creating users "
    
    u1 = User.create(:email => "prashant.sahni5@gmail.com", :username => 'psahni')

    u2 = User.create(:email => "prashant@inxero.com", :username => 'pinxero')

    u3 = User.create(:email => 'ankur@yahoo.com', :username => 'ankur')

    u4  = User.create(:email => 'anand@gmail.com', :username => 'anand')
  
    Article.delete_all
    
    puts "=> Creating articles"
    
    u1.articles.create(:title => "First Article", :body => "Lorem Spam Mane Lorem Spam Mane Lorem Spam ManeLorem Spam Mane Lorem Spam Mane Lorem Spam Mane")
    
    u1.articles.create(:title => "Second Article", :body => "Lorem Spam Mane Lorem Spam Mane Lorem Spam ManeLorem Spam Mane Lorem Spam Mane Lorem Spam Mane")
    
    u2.articles.create(:title => "test article", :body => "Lorem Spam Mane Lorem Spam Mane Lorem Spam ManeLorem Spam Mane Lorem Spam Mane Lorem Spam Mane")
    
    u3.articles.create(:title => " test 2 article", :body => "Lorem Spam Mane Lorem Spam Mane Lorem Spam ManeLorem Spam Mane Lorem Spam Mane Lorem Spam Mane")
    
  end
  
   
end


