class TestingController < ApplicationController


  layout 'templating', :only => [:handlebar]

  def index
  end

  def test
   render :partial => 'test', :status => 200
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
