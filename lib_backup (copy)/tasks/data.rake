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

    puts "==> Creating Messages"
    u1.messages.create(:subject => "Impact of Social Media On People", :body => "The social media these days has a great impact onto the minds of the yound people. They are very much influenced by the content floating across the channels.")

    u1.messages.create(:subject => "Corruption is the root cause of all the problemns", :body => "People of india are surrounded by lot of problems in their daily lives. People have learnt to live with these problems.")
  end




end
