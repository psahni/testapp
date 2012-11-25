class Borrow < ActiveRecord::Base
  attr_accessible :book_id, :user_id
  belongs_to :user
  belongs_to :book
  validates :book_id, :user_id, :presence => true
end
