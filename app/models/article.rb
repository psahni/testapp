class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :media
  has_many :comments, :as => :commentable

  validates :title, :body, :presence => true

  def to_param
    "#{id}-#{title.gsub(/[\s]+/, '-')}"
  end
end
