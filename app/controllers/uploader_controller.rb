class UploaderController < ApplicationController
  
  def index
   render :layout => false
  end
  
  def create
   logger.info "========================================="
   logger.info " Yes Yes Yes"
  end
  
  def html5_uploader
       render :layout => false
  end

end
