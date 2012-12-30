class Message < ActiveRecord::Base
  attr_accessible :body, :subject, :user_id
end
