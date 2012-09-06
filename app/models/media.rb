class Media < ActiveRecord::Base
  
  
  has_many :articles
  
  
  TYPES = { 0 => 'NewsPaper' , 1 =>  'Blogging Website', 2 => 'Magzine' }
  
  DISPLAY_TYPES = { 'NewsPaper' => 0, 'Blogging Website' => 1, 'Magzine' => 2 }
  
  
end
