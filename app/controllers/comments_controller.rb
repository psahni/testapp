class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
      if @comment.save
        render :json => { :notice => "Comment Has Been Created Successfully", :html => html_formatted_comment }
      else
        logger.info @comment.errors.inspect
        render :json => @comment.errors, :status => 401
      end
  end



  private

  def html_formatted_comment
    ("<div class='comment'>" << "#{ @comment.id.to_s } - "  "#{ @comment.message }" << "</div>").html_safe
  end
end
