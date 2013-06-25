class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :message
  belongs_to :commentable, :polymorphic => true, :touch => true

  validates :message, :presence => true
end
