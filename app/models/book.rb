class Book < ActiveRecord::Base
  attr_accessible :category_id, :name
  belongs_to :category
  validates_uniqueness_of :name
end
