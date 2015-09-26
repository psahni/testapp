class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :message
  belongs_to :commentable, :polymorphic => true, :touch => true

  validates :message, :presence => true


  scope :article_comments, ->{
    joins("INNER JOIN articles ON articles.id=comments.commentable_id AND commentable_type='Article'")
    .where('articles.type IS NULL')
  }
  
  scope :special_article_comments, ->{ 
                                  joins("INNER JOIN articles ON articles.id=comments.commentable_id AND commentable_type='Article'")
                                  .where('articles.type =?', 'SpecialArticle') 
  }

#-------------------------------------------------------------------------------------------------------------------
  #
  # FOR ARTICLE AND ITS CHILD CLASSES THE COMMENTABLE TYPE WILL ALWAYS BE ARTICLE
  #
  # NOT RECOMMENDED - IF WE WANT TO SAVE COMMENTS WITH COMMENTABLE TYPE -> SPECIALARTICLE. AND THIS BREAK DESIGN.
  #
  # def commentable_type=(class_name)    
  #   super(class_name)
  # end
#-------------------------------------------------------------------------------------------------------------------  
  #
  # FETCH ONLY CHILD CLASS COMMENTS :: SpecialArticle < Article
  #
  # def special_articles_comments
  #   Comment.joins("INNER JOIN articles ON articles.id=comments.commentable_id AND commentable_type='Article'")
  #   .where('articles.type =?', 'SpecialArticle')
  # end

  
end
