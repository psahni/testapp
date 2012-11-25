class User < ActiveRecord::Base
  has_many :articles
  has_many :medias, :through => :articles
  has_many :comments, :through => :articles
  has_many :borrows
  has_many :books, through:  :borrows
  has_many :categories_of_books, through: :books,  source:  :category
  
  
  def suggested_books
    Book.where("category_id IN (?) AND id NOT IN (?)",  self.categories_of_books(:include => :books), self.books)
  end
end

# => u.medias
# => SELECT `media`.* FROM `media` INNER JOIN `articles` ON `media`.`id` = `articles`.`media_id` WHERE `articles`.`user_id` = <user_id>


#User.reflect_on_all_associations

