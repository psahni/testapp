class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :media
  has_many :comments, :as => :commentable
end
