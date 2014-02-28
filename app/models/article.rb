class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :media
  has_many :comments, :as => :commentable

  #validates :title, :body, :presence => true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  #def to_param
  #  "#{id}-#{title.gsub(/[\s]+/, '-')}"
  #end
end
