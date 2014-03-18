class TestingController < ApplicationController


  layout 'templating', :only => [:handlebar]

  def index
    #awesome_log(request.path, :debug)
    Rails.logger.info "bhai bhai bhai"
    Rails.logger.debug "bhai bhai bhai"
  end

  def test
   #render :partial => 'test', :status => 200
  end
  
  def embedd
  end
  
  def fbtesting
  end

  def handlerbar
  end

  def upload_image
    @user = User.first
    if request.put?
      @user.avatar = params[:user][:avatar]
      @user.save!
      logger.info "Avatar: #{ @user.avatar.url }"
    end
  end

  def responsive
    render :layout => false
  end
end
