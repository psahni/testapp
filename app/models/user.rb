class User < ActiveRecord::Base
  has_many :articles
  has_many :medias, :through => :articles
end

# => u.medias
# => SELECT `media`.* FROM `media` INNER JOIN `articles` ON `media`.`id` = `articles`.`media_id` WHERE `articles`.`user_id` = <user_id>

