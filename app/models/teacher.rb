class Teacher < ActiveRecord::Base

  attr_accessible :name, :qualification

  QUALIFICATION = { 1 => "Graduation", 2 => "Post Graduation", 3 => "Phd"}

  validates :name, :qualification, :presence => true

end
